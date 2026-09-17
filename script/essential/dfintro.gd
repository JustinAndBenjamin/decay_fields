extends CanvasLayer

@onready var video_player = $AspectRatioContainer/VideoStreamPlayer
@onready var finished : bool = false
@onready var scene : PackedScene

func _on_intro_video_finished() -> void:
	finished = true
	var fade_overlay = $dfintro_fade
	
	if fade_overlay and self:
		fade_overlay.visible = true
		fade_overlay.modulate.a = 1.0
		
		if video_player:
			video_player.stop()
			video_player.visible = false
		
		var tween = create_tween()
		tween.tween_property(fade_overlay, "modulate:a", 0.0, 1.2)
		
		tween.finished.connect(func():
			self.queue_free()
		)
	
func _process(_delta: float) -> void:
	if finished:
		if scene:
			get_tree().change_scene_to_packed(scene)
