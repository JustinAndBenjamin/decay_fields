extends CanvasLayer

var IMAGE = false
var TEXT = false
var catch = false
var BODY = false
@onready var inventory = get_tree().root.find_child("Inventory", true, false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Background.mouse_filter = Control.MOUSE_FILTER_PASS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func add():
		if catch == true:
			hide()
			if BODY.name == "Player":
				if BODY.balls > 0:
					BODY.balls -= 1
					inventory.add(TEXT, IMAGE)
					clean()
		


	
func setup(image, text, body):
	show()
	IMAGE = image
	TEXT = text
	BODY = body
	$Background/Name.text = TEXT
	$Background/Monpok.texture = IMAGE
	if body.balls <= 0:
		$Background/CatchButton.disabled = true
	else:
		$Background/CatchButton.disabled = false
	
func clean():
	IMAGE = false
	TEXT = false
	BODY = false
	catch = false
	$Background/Name.text = "Monpok"
	$Background/Monpok.texture = null


func _on_catch_button_pressed() -> void:
	catch = true
	add()


func _on_escape_button_pressed() -> void:
	hide()
