extends CanvasLayer

@onready var label = $MarginContainer/VBoxContainer1/Label

func _ready():
	if GlobalTexts.currentFase == "1":
		label.text = "A fase 1 consiste em..."
	
	if GlobalTexts.currentFase == "2":
		label.text = "A fase 2 consiste em..."
	
	if GlobalTexts.currentFase == "3":
		label.text = "A fase 3 consiste em..."
	

func _on_button_pressed():
	
	get_tree().change_scene_to_file("res://Scenes/fase_" + GlobalTexts.currentFase +".tscn")
