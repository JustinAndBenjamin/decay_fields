extends Node


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	var is_mobile = OS.has_feature("mobile") or OS.has_feature("web_android") or OS.has_feature("web_ios")
	
	if is_mobile:
		$CanvasLayer.show()
	else:
		$CanvasLayer.hide()
