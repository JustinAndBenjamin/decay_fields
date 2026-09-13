extends Node

@export var cell_size : int = int(20)

@export var scenes : Array[PackedScene]
@export var probabilities : Array[int]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Validierung
	if scenes.size() != probabilities.size():
		push_error("Fehler: scenes.size() (%d) != probabilities.size() (%d)" % [scenes.size(), probabilities.size()])
	
	# Warnung wenn leere Einträge vorhanden sind
	for i in range(scenes.size()):
		if scenes[i] == null:
			push_warning("Warnung: scenes[%d] ist null!" % i)
		if probabilities[i] == 0:
			push_warning("Warnung: probabilities[%d] ist 0!" % i)
	
	var area_size = $SpawnArea.size
	spawn_grid(area_size)
	
func spawn_grid(area_size):
	var columns = int(area_size.x / cell_size)
	var rows = int(area_size.y / cell_size)
	
	var start_pos = $SpawnArea.global_position
	
	for x in range(columns):
		for y in range(rows):
			var roll = randf() * 100
			
			var spawn_pos = start_pos + Vector2(x * cell_size, y * cell_size)
			spawn_pos += Vector2(cell_size / 2.0, cell_size / 2.0)
			
			for i in range(probabilities.size()):
				if roll < probabilities[i]:
					spawn_object(scenes[i], spawn_pos)
					break
				
func spawn_object(scene:PackedScene, pos:Vector2):
	if scene == null:
		return
	var instance = scene.instantiate()
	add_child(instance)
	if instance is AnimatableBody2D:
		instance.global_position = pos
