extends Node2D


func _ready():
	pass


func _process(delta):
	pass


func _on_button_pressed():
	GlobalTexts.mode = "NORMAL"
	print(GlobalTexts.mode)
	get_tree().change_scene_to_file("res://Scenes/between_stages.tscn")

func _on_button_2_pressed():
	GlobalTexts.mode = "HARD"
	print(GlobalTexts.mode)
	get_tree().change_scene_to_file("res://Scenes/between_stages.tscn")
