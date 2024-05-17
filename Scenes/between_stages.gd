extends CanvasLayer

@onready var label = $MarginContainer/VBoxContainer1/Label

func _ready():
	if GlobalTexts.currentFase == "1":
		label.text = "
Na primeira fase, o jogador embarcará na busca pelas decorações essenciais para a festa. Entre elas, estarão os chapeuzinhos, os balões, as cadeiras, trampolim, e as mesas. O desafio será encontrar e coletar cada uma dessas decorações enquanto navega pela sala, utilizando as setas do teclado para movimentar o personagem e a tecla de espaço para coletar os itens corretos."
	
	if GlobalTexts.currentFase == "2":
		label.text = "Na segunda fase, a missão do jogador será fazer os doces, que serão o destaque da festa. Os objetos finais a serem coletados incluirão doces como brigadeiros, beijinhos, e outros. Para produzi-los, o jogador terá que juntar os ingredientes essenciais: leite condensado, chocolate em pó, manteiga, açúcar e leite em pó."
	
	if GlobalTexts.currentFase == "3":
		label.text = "A fase 3 consiste em..."
	

func _input(ev):
	if Input.is_key_pressed(KEY_BACKSPACE) || Input.is_key_pressed(KEY_SPACE) || Input.is_key_pressed(KEY_RIGHT) || Input.is_key_pressed(KEY_LEFT):
		_on_button_pressed()
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/fase_" + GlobalTexts.currentFase +".tscn")
