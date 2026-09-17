extends Node2D

@export var scene: PackedScene
@export var tutorial : String
@export var anim : AnimatedSprite2D
@export var stop_music : AudioStreamPlayer2D
@export var dfintro : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Trigger is ready")
	if not stop_music:
		stop_music = get_tree().root.find_child("MainMusic", true, false)

func trigger(body) -> void:
	if anim:
			anim.play()
	if stop_music:
		stop_music.stop()
	var timer = get_tree().create_timer(0.8)
	await timer.timeout
	if body.name == "Player":
		if scene:
			var new_scene = dfintro.instantiate()
			
			new_scene.scene = scene
			
			get_tree().root.add_child(new_scene)
			get_tree().current_scene.queue_free()
			get_tree().current_scene = new_scene


func _on_area_2d_body_entered(body: Node2D) -> void:
	trigger(body)
