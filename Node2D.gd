extends Node2D

@onready var balloon = $Balloon
@onready var chair = $Chair
@onready var party_hat = $"Party Hat"
@onready var table = $Table
@onready var trampoline = $Trampoline

var listObjects = ["balloon","chair","party_hat","table","trampoline"]
var objects = listObjects.duplicate()
var answer = ""
var lives = 3

var red = Color(1.0,0.0,0.0,1.0) 
var green = Color(0.0,1.0,0.0,1.0)

func _ready():
	randomize()
	selectWord()

func selectWord():
	if objects.size() > 0:
		var index = randi() % objects.size()
		$Item.text = objects[index]
		answer = objects[index]
	else:
		get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")
		
	if lives == 0:
		get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")

func checkAnswer(guess):
	if answer == guess:
		objects.erase(guess)
		$Resposta.add_theme_color_override("font_color", Color.GREEN)
		$Resposta.text = "Você acertou!"
	else:
		lives -= 1
		$Vidas.text = "Vidas: %d" % lives
		$Resposta.add_theme_color_override("font_color", Color.RED)
		$Resposta.text = "Você errou..."
	_ready()

func _on_balloon_pressed():
	checkAnswer("balloon")
func _on_chair_pressed():
	checkAnswer("chair")
func _on_party_hat_pressed():
	checkAnswer("party_hat")
func _on_table_pressed():
	checkAnswer("table")
func _on_trampoline_pressed():
	checkAnswer("trampoline")
