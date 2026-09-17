extends Node2D

@export var scene: PackedScene
@export var tutorial : String
@export var anim : AnimatedSprite2D
@export var stop_music : AudioStreamPlayer2D


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
			get_tree().change_scene_to_packed(scene)


func _on_area_2d_body_entered(body: Node2D) -> void:
	trigger(body)
