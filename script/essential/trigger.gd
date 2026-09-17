extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Trigger is ready")

func trigger() -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	trigger()


func _on_area_2d_area_entered(area: Area2D) -> void:
	trigger()
