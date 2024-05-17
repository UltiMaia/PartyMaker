extends CanvasLayer


func _input(ev):
	if Input.is_key_pressed(KEY_BACKSPACE) || Input.is_key_pressed(KEY_SPACE) || Input.is_key_pressed(KEY_RIGHT) || Input.is_key_pressed(KEY_LEFT):
		_on_button_pressed()
	
func _on_button_pressed():
	GlobalTexts.currentFase = "1"
	get_tree().change_scene_to_file("res://Scenes/between_stages.tscn")
