extends Node

@onready var Audio = $Audio
@onready var full_time : float
@onready var voice : AudioStream
@onready var canvas_layer = $CanvasLayer


func speech(text) -> void:
	canvas_layer.show()
	
	var text_length = text.length()
	var wait_time : float = full_time / text_length
	
	Audio.play()
	for buchstabe in text:
		$CanvasLayer/Control/MarginContainer/Label.text += str(buchstabe)
		var timer = get_tree().create_timer(wait_time)
		await timer.timeout
	
	var delete_time = get_tree().create_timer(2)
	await delete_time.timeout
	$CanvasLayer/Control/MarginContainer/Label.text = ""
	canvas_layer.hide()

func setup_speech(audio : AudioStream) -> void:
	Audio.set_stream(audio)
	full_time = Audio.stream.get_length()
