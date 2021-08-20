extends Node

onready var dictionary = preload("res://dictionary.gd").new().data

func fill_dictionary():
	$MarginContainer/VBoxContainer/WordsList.clear()
	for item in dictionary:
		if ($MarginContainer/VBoxContainer/HBoxContainer/ToggleLanguage.is_ru_eng):
			$MarginContainer/VBoxContainer/WordsList.add_item(dictionary[item] + " - " + item)
		else: 
			$MarginContainer/VBoxContainer/WordsList.add_item(item + " - " + dictionary[item])
	$MarginContainer/VBoxContainer/WordsList.sort_items_by_text()	

func _ready():
	fill_dictionary()

func _on_StartTrain_pressed():
	get_tree().change_scene("res://Train.tscn")

func _on_ToggleLanguage_language_changed():
	fill_dictionary()
