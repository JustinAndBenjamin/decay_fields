extends Area2D

@export var music: AudioStream
@onready var audio_stream_player = get_tree().root.find_child("AudioStreamPlayer2D", true, false)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if audio_stream_player.stream == music:
			pass
		else:
			audio_stream_player.stream = music
			audio_stream_player.play()
