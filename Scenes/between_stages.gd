extends CanvasLayer

@onready var label = $Label
@onready var timer_2 = $Timer2
@onready var button = $Button

func _ready():
	button.add_theme_color_override("font_color", Color(248,192,0))
	if GlobalTexts.currentFase == "1":
		label.text = "Na primeira fase, o jogador coletará as\ndecorações essenciais para a festa: \nchapeuzinhos, balões, cadeiras, \ntrampolim, e as mesas."
	
	if GlobalTexts.currentFase == "2":
		label.text = "Na segunda fase, a missão do jogador será	\ncoletar os ingredientes dos doces:\nleite condensado, chocolate em pó, manteiga,\naçúcar e leite em pó."
	
	if GlobalTexts.currentFase == "3":
		label.text = "Na fase 3 você irá escolher\nos ingredientes para fazer o bolo "
	
	if GlobalTexts.currentFase == "Loose":
		label.text = "Você perdeu :("
		
	

func _input(ev):
	if Input.is_key_pressed(KEY_BACKSPACE) || Input.is_key_pressed(KEY_SPACE) || Input.is_key_pressed(KEY_RIGHT) || Input.is_key_pressed(KEY_LEFT):
		_on_button_pressed()
	
func _on_button_pressed():
	if GlobalTexts.currentFase == "Loose":
		get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")
		return
	get_tree().change_scene_to_file("res://Scenes/fase_" + GlobalTexts.currentFase +".tscn")


func _on_timer_2_timeout():
	var actualColor = button.get("theme_override_colors/font_color")
	if actualColor == Color(248,192,0, 1):
		button.add_theme_color_override("font_color", Color(0,0,0))
	else:
		button.add_theme_color_override("font_color", Color(248,192,0))

