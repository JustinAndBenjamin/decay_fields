extends AnimatableBody2D

@export var IMAGE : AtlasTexture
@export var TEXT : String

@onready var inventory = get_tree().root.find_child("Inventory", true, false)
@onready var OnMonpokCaptured = get_tree().root.find_child("OnMonpokCaptured", true, false)
var catch = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		OnMonpokCaptured.setup(IMAGE, TEXT, body)
		if body.balls > 0:
			if inventory.full == false:
				queue_free()
			else:
				pass
