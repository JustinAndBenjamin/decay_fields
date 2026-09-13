extends Control

var inventory = {}
var full = bool(false)

func _ready() -> void:
	if Global.hat_inventar:
		inventory = Global.inventar
		Global.hat_inventar = false

func _process(delta: float) -> void:
	for i in inventory:
		var load_text = inventory[i].keys()[0]
		var load_image = inventory[i][load_text]
		if typeof(load_text) == TYPE_STRING:
			var direction_label = get_node("Monpok" + str(i) + "/Label")
			direction_label.text = load_text
		var direction_rect = get_node("Monpok" + str(i) + "/TextureRect")
		direction_rect.texture = load_image
	
func add(TEXT, IMAGE):
	full = false
	var count : int = 1
	for i in inventory:
		count +=1
	if count <= 10:
		var direction_rect = get_node("Monpok" + str(count) + "/TextureRect")
		var direction_label = get_node("Monpok" + str(count) + "/Label")
		direction_rect.texture = IMAGE
		direction_label.text = TEXT
		inventory[count] = {
			TEXT : IMAGE
		} 
	else:
		full = true
		$Timer.start()
		show()
		$Label.show()


func _on_timer_timeout() -> void:
	hide()
	$Label.hide()


func _on_clear_inventory_pressed() -> void:
	for place in range(inventory.size()):
		place += 1
		var direction_rect = get_node("Monpok" + str(place) + "/TextureRect")
		var direction_label = get_node("Monpok" + str(place) + "/Label")
		if direction_rect:
			direction_rect.texture = null
		if direction_label:
			direction_label.text = ""
	inventory = {}
		
		
		
