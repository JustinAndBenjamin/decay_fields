extends Control

@export var scene_1 : PackedScene
@export var scene_2 : PackedScene
@export var scene_3 : PackedScene



func _on_monpok_map_pressed() -> void:
	if scene_1:
		get_tree().change_scene_to_packed(scene_1)


func _on_npc_test_pressed() -> void:
	if scene_2:
		get_tree().change_scene_to_packed(scene_2)


func _on_house_map_pressed() -> void:
	if scene_3:
		get_tree().change_scene_to_packed(scene_3)


func _on_laden_pressed() -> void:
	var saved_data = SaveSystem.load_game()
	Global.geladene_position = saved_data["player_position"]
	Global.hat_position = true
	Global.inventar = saved_data["inventory"]
	Global.hat_inventar = true
	get_tree().change_scene_to_file(saved_data["current_scene"])
