extends Node2D

@onready var condensed_milk = $"Condensed Milk"
@onready var chocolate_powder = $"Chocolate Powder"
@onready var butter = $Butter
@onready var sugar = $Sugar
@onready var powdered_milk = $"Powdered Milk"
@onready var texture_rect = $MarginContainer/TextureRect
@onready var wrong_answer_sound = $"Wrong Answer Sound"
@onready var right_answer_sound = $"Right Answer Sound"

var textureButtonList = []
var listObjects = ["Condensed Milk","Chocolate Powder","Butter","Sugar","Powdered Milk"]
var objects = listObjects.duplicate()
var answer = ""
var lives = 3
var rightAnswer = ""
var red = Color(1.0,0.0,0.0,1.0) 
var green = Color(0.0,1.0,0.0,1.0)
var selectedItem = 2

func _ready():
	textureButtonList = [condensed_milk,chocolate_powder,butter,sugar,powdered_milk]
	reduceButtonsOpacity()
	texture_rect.modulate.a = 0.5
	randomize()
	selectWord()

func selectWord():
	if objects.size() > 0:
		var index = randi() % objects.size()
		$Item.text = objects[index]
		answer = objects[index]
	else:
		GlobalTexts.currentFase = "3"
		get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")
		
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
		lives -= 1
		$Vidas.text = "VIDAS: %d" % lives
		$Resposta.add_theme_color_override("font_color", Color.RED)
		$Resposta.text = "Você errou..."
	_ready()

func _on_condensed_milk_pressed():
	checkAnswer("Cake")
func _on_chocolate_powder_pressed():
	checkAnswer("Flour")
func _on_sugar_pressed():
	checkAnswer("Candle")
func _on_powdered_milk_pressed():
	checkAnswer("Egg")
func _on_butter_pressed():
	checkAnswer("Milk")
	
func reduceButtonsOpacity():
	match rightAnswer:
		"Cake":
			condensed_milk.modulate.a = 0.5
		"Flour":
			chocolate_powder.modulate.a = 0.5
		"Candle":
			butter.modulate.a = 0.5
		"Egg":
			sugar.modulate.a = 0.5
		"Milk":
			powdered_milk.modulate.a = 0.5

func selectItem(elementSelected: TextureButton):
	var texture = elementSelected.name + "_selected"
	var texturePath = "res://Assets/Fase 2/" + texture + ".png"
	elementSelected.texture_normal = ResourceLoader.load(texturePath)

func unselectItem(elementSelected: TextureButton):
	var texture = elementSelected.name 
	var texturePath = "res://Assets/Fase 2/" + texture + ".png"
	elementSelected.texture_normal = ResourceLoader.load(texturePath)

func _input(ev):
	print(ev)
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
	if Input.is_key_pressed(KEY_BACKSPACE) || Input.is_key_pressed(KEY_SPACE):
		checkAnswer(listObjects[selectedItem])
	
	selectItemByIndex()

func getCurrentSelectedTextureButton():
	return textureButtonList[selectedItem]


func selectItemByIndex():
	selectItem(textureButtonList[selectedItem])
