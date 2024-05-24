extends Node2D

@onready var normal = $VBoxContainer/Normal
@onready var hard = $VBoxContainer/Hard
@onready var timer = $Timer

var buttonSelected = "NORMAL"

func _ready():
	changeButtonStyle()
	


func _process(delta):
	pass

func _input(ev):
	if Input.is_key_pressed(KEY_RIGHT):
		if buttonSelected == "NORMAL":
			buttonSelected = "HARD"
		else:
			buttonSelected = "NORMAL"
	if Input.is_key_pressed(KEY_LEFT):
		if buttonSelected == "NORMAL":
			buttonSelected = "HARD"
		else:
			buttonSelected = "NORMAL"
	changeButtonStyle()	
	if Input.is_key_pressed(KEY_BACKSPACE) || Input.is_key_pressed(KEY_SPACE):
		selectOption()
	
func selectOption():
	print(buttonSelected + " selected")
	GlobalTexts.mode = buttonSelected
	get_tree().change_scene_to_file("res://Scenes/between_stages.tscn")

func _on_button_pressed():
	GlobalTexts.mode = buttonSelected
	get_tree().change_scene_to_file("res://Scenes/between_stages.tscn")

func _on_button_2_pressed():
	GlobalTexts.mode = buttonSelected
	get_tree().change_scene_to_file("res://Scenes/between_stages.tscn")

func changeButtonStyle():
	if buttonSelected == "NORMAL":
		changeNormalColors()
	else:
		changeHardColors()
		
func changeNormalColors():
	normal.add_theme_color_override("font_color", Color(248,192,0))
	hard.add_theme_color_override("font_color", Color(255,255,255))
		
func changeHardColors():
	hard.add_theme_color_override("font_color", Color(248,192,0))
	normal.add_theme_color_override("font_color", Color(255,255,255))
		
func _on_Timer_timeout():
	print("Função chamada a cada 0.3 segundos")


func _on_timer_timeout():
	if buttonSelected == "NORMAL":
		var actualColor = normal.get("theme_override_colors/font_color")
		if actualColor == Color(248,192,0, 1):
			normal.add_theme_color_override("font_color", Color(0,0,0))
		else:
			normal.add_theme_color_override("font_color", Color(248,192,0))
	else:
		var actualColor = hard.get("theme_override_colors/font_color")
		if actualColor == Color(248,192,0, 1):
			hard.add_theme_color_override("font_color", Color(0,0,0))
		else:
			hard.add_theme_color_override("font_color", Color(248,192,0))
		
