extends Node2D

var words = ["Balloon", "Chair", "Party Hat", "Table", "Trampoline"]

func _ready():
	randomize()
	selectWord()

func selectWord():
	var index = randi() % words.size()
	$Label.text = words[index]

