extends CharacterBody2D
class_name Player

const SPEED = float(130.0)
const FRICTION = int(5000)
const ACCELARATION = int(600)
var balls: int = int(0)

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var tap: AudioStreamPlayer2D = $tap
@onready var tap_timer: Timer = $tap_timer

func _ready() -> void:
	if Global.hat_position:
		global_position = Global.geladene_position
		Global.hat_position = false

func _physics_process(delta: float) -> void:
	%GameManager.update_balls(balls)
	if %GameManager.all_locked == true:
		return
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
		
	if direction.length() == 0:
		animated_sprite.play("idle")
		tap_timer.stop()
	else:
		if abs(direction.y) > abs(direction.x):
			if direction.y > 0:
				animated_sprite.play("run_f")
			else:
				animated_sprite.play("run_b")
		else:
			animated_sprite.play("run")
			
		if tap_timer.is_stopped():
			tap_timer.start()
	
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELARATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move_and_slide()


func _on_tap_timer_timeout() -> void:
	tap.play()
	



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("balls"):
		balls += 1
		area.queue_free()
