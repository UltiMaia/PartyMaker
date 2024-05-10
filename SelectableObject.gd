extends Area2D

var correctWord : String

func _on_body_entered(body):
	if body.name == correctWord:
		print("Você acertou!")
	else:
		print("Você errou!")
