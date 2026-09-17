extends Node2D

@export var scene: PackedScene
@export var tutorial : String
@export var anim : AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Trigger is ready")

func trigger(body) -> void:
	if body.name == "Player":
		if scene:
			get_tree().change_scene_to_packed(scene)
		if anim:
			anim.play()


func _on_area_2d_body_entered(body: Node2D) -> void:
	trigger(body)
