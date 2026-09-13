extends Area2D

@onready var animated_sprite = $AnimatedSprite2D

var ball = bool(true)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	




func _on_body_entered(body: Node2D) -> void:
	animated_sprite.play("default")
	if body is Player:
		if ball == true:
			ball = false
			body.balls += 1


func _on_animated_sprite_2d_animation_finished() -> void:
	ball = true
	animated_sprite.play("available")
