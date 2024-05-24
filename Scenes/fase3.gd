extends Node2D

@onready var cake = $"Cake"
@onready var candle = $"Candle"
@onready var egg = $Egg
@onready var flour = $Flour
@onready var milk = $"Milk"
@onready var texture_rect = $MarginContainer/TextureRect
@onready var right_answer_sound = $"Right Answer Sound"
@onready var wrong_answer_sound = $"Wrong Answer Sound"
@onready var lost_sound = $"Lost Sound"
@onready var background_music = $"Background Music"


var mainSongPlaying = false
var textureButtonList = []
var listObjects = ["Cake","Candle","Egg","Flour","Milk"]
var objects = listObjects.duplicate()
var answer = ""
var lives = 3
var rightAnswer = ""
var red = Color(1.0,0.0,0.0,1.0) 
var green = Color(0.0,1.0,0.0,1.0)
var selectedItem = 2

func _ready():
	print(GlobalTexts.lifes)
	print(GlobalTexts.mode)
	print(GlobalTexts.mode == "HARD")
	if GlobalTexts.mode == "HARD":
		print("entrou")
		lives = GlobalTexts.lifes
		$Vidas.text = "VIDAS: %d" % lives
		
	if !mainSongPlaying:
		# background_music.play()
		mainSongPlaying = true 
	textureButtonList = [cake,candle,egg,flour,milk]
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
		lost_sound.play()
		GlobalTexts.currentFase = "Loose"
		get_tree().change_scene_to_file("res://Scenes/between_stages.tscn")

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
		GlobalTexts.lifes -= 1
		$Vidas.text = "VIDAS: %d" % lives
		$Resposta.add_theme_color_override("font_color", Color.RED)
		$Resposta.text = "Você errou..."
		wrong_answer_sound.play()
	_ready()

func reduceButtonsOpacity():
	match rightAnswer:
		"Cake":
			cake.modulate.a = 0.5
		"Candle":
			candle.modulate.a = 0.5
		"Egg":
			egg.modulate.a = 0.5
		"Flour":
			flour.modulate.a = 0.5
		"Milk":
			milk.modulate.a = 0.5

func selectItem(elementSelected: TextureButton):
	var texture = elementSelected.name + "_selected"
	print(texture)
	var texturePath = "res://Assets/Fase 2/" + texture + ".png"
	elementSelected.texture_normal = ResourceLoader.load(texturePath)

func unselectItem(elementSelected: TextureButton):
	var texture = elementSelected.name 
	print(texture)
	var texturePath = "res://Assets/Fase 2/" + texture + ".png"
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
	if Input.is_key_pressed(KEY_BACKSPACE) || Input.is_key_pressed(KEY_SPACE):
		checkAnswer(listObjects[selectedItem])
	
	selectItemByIndex()

func getCurrentSelectedTextureButton():
	return textureButtonList[selectedItem]


func selectItemByIndex():
	selectItem(textureButtonList[selectedItem])


func _on_cake_pressed():
	checkAnswer("Cake")
func _on_candle_pressed():
	checkAnswer("Candle")
func _on_egg_pressed():
	checkAnswer("Egg")
func _on_flour_pressed():
	checkAnswer("Flour")
func _on_milk_pressed():
	checkAnswer("Milk")
