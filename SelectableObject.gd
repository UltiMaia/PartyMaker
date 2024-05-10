extends Area2D

var correctWord : String
var clickedObject = null

func _on_mouse_entered():
	# Quando o mouse entra em um objeto, destaca ele
	$Object.modulate = Color(1, 1, 0) # Destaque amarelo

func _on_mouse_exited():
	# Quando o mouse sai de um objeto, remove o destaque
	$Object.modulate = Color(1, 1, 1) # Remove o destaque

func _on_Object_input_event(viewport, event, shape_idx):
	# Quando um objeto é clicado
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		clickedObject = get_node(viewport.get_mouse_over()) # Captura o objeto clicado
		checkAnswer()

func checkAnswer():
	if clickedObject.name == wordToFind:
		# Se o objeto clicado corresponder à palavra
		print("Correto!")
		# Aqui você pode adicionar o código para o jogador ter ganho
	else:
		print("Incorreto! Tente novamente.")
		# Aqui você pode adicionar o código para o jogador tentar novamente
