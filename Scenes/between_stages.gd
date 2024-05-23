extends CanvasLayer

@onready var label = $Label

func _ready():
	if GlobalTexts.currentFase == "1":
		label.text = "Na primeira fase, o jogador coletará as\ndecorações essenciais para a festa: \nchapeuzinhos, balões, cadeiras, \ntrampolim, e as mesas."
	
	if GlobalTexts.currentFase == "2":
		label.text = "Na segunda fase, a missão do jogador será	\ncoletar os ingredientes dos doces:\nleite condensado, chocolate em pó, manteiga,\naçúcar e leite em pó."
	
	if GlobalTexts.currentFase == "3":
		label.text = "A fase 3 consiste em..."
	
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
