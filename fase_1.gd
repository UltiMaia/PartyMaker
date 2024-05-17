extends Node2D

@onready var balloon = $Balloon
@onready var chair = $Chair
@onready var party_hat = $"Party Hat"
@onready var table = $Table
@onready var trampoline = $Trampoline
@onready var wrong_answer_sound = $"Wrong Answer Sound"
@onready var right_answer_sound = $"Right Answer Sound"

var textureButtonList = []
var listObjects = ["Balloon","Chair","Party Hat","Table","Trampoline"]
var objects = listObjects.duplicate()
var answer = ""
var lives = 3
var rightAnswer = ""
var selectedItem = 2

var white_box = Control.new()
var red = Color(1.0,0.0,0.0,1.0) 
var green = Color(0.0,1.0,0.0,1.0)

func _ready():
	textureButtonList = [balloon, chair, party_hat,table,trampoline]
	reduceButtonsOpacity()
	randomize()
	selectWord()

func selectWord():
	if objects.size() > 0:
		var index = randi() % objects.size()
		$Item.text = objects[index]
		answer = objects[index]
	else:
		GlobalTexts.currentFase = "2"
		get_tree().change_scene_to_file("res://Scenes/between_stages.tscn")
		
	if lives == 0:
		wrong_answer_sound.play()
		get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")

func checkAnswer(guess):
	if !objects.has(guess):
		return;
	
	if answer == guess:
		objects.erase(answer)
		$Resposta.add_theme_color_override("font_color", Color.GREEN)
		$Resposta.text = "Você acertou!"
		rightAnswer = guess
		right_answer_sound.play()
	else:
		$Vidas.text = "VIDAS: %d" % lives
		$Resposta.add_theme_color_override("font_color", Color.RED)
		$Resposta.text = "Você errou..."
		
	_ready()

func _on_balloon_pressed():
	checkAnswer("Balloon")
func _on_chair_pressed():
	checkAnswer("Chair")
func _on_party_hat_pressed():
	checkAnswer("Party Hat")
func _on_table_pressed():
	checkAnswer("Table")
func _on_trampoline_pressed():
	checkAnswer("Trampoline")
	
func reduceButtonsOpacity():
	match rightAnswer:
		"Balloon":
			balloon.modulate.a = 0.5
		"Chair":
			chair.modulate.a = 0.5
		"Party Hat":
			party_hat.modulate.a = 0.5
		"Table":
			table.modulate.a = 0.5
		"Trampoline":
			trampoline.modulate.a = 0.5

func selectItem(elementSelected: TextureButton):
	var texture = elementSelected.name + "_selected"
	var texturePath = "res://Assets/Fase 1/assets-aniversario/" + texture + ".png"
	print(texturePath)
	elementSelected.texture_normal = ResourceLoader.load(texturePath)

func unselectItem(elementSelected: TextureButton):
	var texture = elementSelected.name 
	var texturePath = "res://Assets/Fase 1/assets-aniversario/" + texture + ".png"
	elementSelected.texture_normal = ResourceLoader.load(texturePath)

func _input(ev):
	if Input.is_key_pressed(KEY_RIGHT):
		var selectedItemTexture = getCurrentSelectedTextureButton()
		unselectItem(selectedItemTexture)
		if selectedItem == 4:
			selectedItem = 0
		else:
			selectedItem += 1
	if Input.is_key_pressed(KEY_LEFT):
		var selectedItemTexture = getCurrentSelectedTextureButton()
		unselectItem(selectedItemTexture)
		if selectedItem == 0:
			selectedItem = 4
		else:
			selectedItem -= 1
	if Input.is_key_pressed(KEY_SPACE):
		checkAnswer(getCurrentSelectedTextureButton().name)
	selectItemByIndex()

func getCurrentSelectedTextureButton():
	return textureButtonList[selectedItem]


func selectItemByIndex():
	selectItem(textureButtonList[selectedItem])