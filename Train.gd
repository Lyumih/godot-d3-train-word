extends Node

onready var dictionary = preload("res://dictionary.gd").new().data

export var is_show_word = false
var wordFirst = ""
var wordSecond = ""

func show_word():
	if (!is_show_word): 
		is_show_word = true
		$MarginContainer/VBoxContainer/CenterContainer/EndWord.text = wordSecond
		$MarginContainer/VBoxContainer/HBoxContainer2/ShowWord.text = "Продолжить"
	

func hide_word():
	is_show_word = false
	$MarginContainer/VBoxContainer/CenterContainer/EndWord.text = "???"
	$MarginContainer/VBoxContainer/HBoxContainer2/ShowWord.text = "Посмотреть"
	
	
func next_word():
	var wordKey = get_random_word_key()
	if (!$MarginContainer/VBoxContainer/HBoxContainer/ToggleLanguage.is_ru_eng):
		wordFirst = wordKey
		wordSecond = dictionary[wordKey]
	else: 
		wordFirst = dictionary[wordKey]
		wordSecond = wordKey
	$MarginContainer/VBoxContainer/CenterContainer/StartWord.text = wordFirst
	hide_word()
	
func get_random_word_key():
	return dictionary.keys()[randi () %dictionary.size()]

func _ready():
	randomize()
	next_word()

func _on_ShowWord_pressed():
	if (!is_show_word): show_word()
	else: next_word()


func _on_Continue_pressed():
	next_word()


func _on_ToggleLanguage_language_changed():
	next_word()
