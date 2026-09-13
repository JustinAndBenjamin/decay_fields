extends Node

var all_locked = bool(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("inventory"):
		if not $CanvasLayer/Inventory.visible:
			$CanvasLayer/Inventory.show()
		else:
			$CanvasLayer/Inventory.hide()
			
	all_locked = $CanvasLayer/Inventory.is_visible_in_tree()

func update_balls(balls):
	balls = str(balls)
	$CanvasLayer/Balls/Label.text = balls


func _on_touch_screen_button_pressed() -> void:
	if not $CanvasLayer/Inventory.visible:
			$CanvasLayer/Inventory.show()
	else:
		$CanvasLayer/Inventory.hide()
