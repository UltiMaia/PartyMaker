extends CanvasLayer


func _on_button_pressed():
	GlobalTexts.currentFase = "1"
	get_tree().change_scene_to_file("res://Scenes/between_stages.tscn")
