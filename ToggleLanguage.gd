extends Button

signal language_changed
export var is_ru_eng = false

func toggle_language():
	is_ru_eng = !is_ru_eng
	set_language()
	emit_signal("language_changed")
	
func set_language():
	if (is_ru_eng): $".".text = "RU->ENG"
	else: $".".text = "ENG->RU"
	
func _ready():
	set_language()

func _on_ToggleLanguage_pressed():
	toggle_language()
