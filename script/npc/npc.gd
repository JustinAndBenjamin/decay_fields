extends CharacterBody2D

@onready var speech_bubble = $SpeechBubble
@onready var triggered : bool = false

@export var text : String
@export var speech : AudioStream

func _ready() -> void:
	speech_bubble.setup_speech(speech)

func _on_speech_trigger_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if triggered == false:
			speech_bubble.speech(text)
			triggered = true
