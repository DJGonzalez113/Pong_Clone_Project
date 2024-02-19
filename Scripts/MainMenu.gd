extends Control


onready var select_1 = $MarginContainer/CenterContainer/VBoxContainer/HBoxContainer/VBoxContainer/CenterContainer3/HBoxContainer/Selector
onready var select_2 = $MarginContainer/CenterContainer/VBoxContainer/HBoxContainer/VBoxContainer/CenterContainer4/HBoxContainer/Selector
onready var select_3 = $MarginContainer/CenterContainer/VBoxContainer/HBoxContainer/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var select_4 = $MarginContainer/CenterContainer/VBoxContainer/HBoxContainer/VBoxContainer/CenterContainer2/HBoxContainer/Selector

var current_selector


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/CenterContainer/VBoxContainer/HBoxContainer/VBoxContainer/CenterContainer3/HBoxContainer/Play.grab_focus()
	current_selector = 0
	set_selector(current_selector)

func set_selector(selector):
	select_1.text = ""
	select_2.text = ""
	select_3.text = ""
	select_4.text = ""
	if selector == 0:
		select_1.text = ">"
	elif selector == 1:
		select_2.text = ">"
	elif selector == 2:
		select_3.text = ">"
	elif selector == 3:
		select_4.text = ">"

func _on_Play_mouse_entered():
	$MarginContainer/CenterContainer/VBoxContainer/HBoxContainer/VBoxContainer/CenterContainer3/HBoxContainer/Play.grab_focus()

func _on_Play2_mouse_entered():
	$MarginContainer/CenterContainer/VBoxContainer/HBoxContainer/VBoxContainer/CenterContainer4/HBoxContainer/Play2.grab_focus()

func _on_Options_mouse_entered():
	$MarginContainer/CenterContainer/VBoxContainer/HBoxContainer/VBoxContainer/CenterContainer/HBoxContainer/Options.grab_focus()

func _on_Quit_mouse_entered():
	$MarginContainer/CenterContainer/VBoxContainer/HBoxContainer/VBoxContainer/CenterContainer2/HBoxContainer/Quit.grab_focus()

func _on_Play_focus_entered():
	current_selector = 0
	set_selector(current_selector)
	$HoverSFX.play()

func _on_Play2_focus_entered():
	current_selector = 1
	set_selector(current_selector)
	$HoverSFX.play()

func _on_Options_focus_entered():
	current_selector = 2
	set_selector(current_selector)
	$HoverSFX.play()

func _on_Quit_focus_entered():
	current_selector = 3
	set_selector(current_selector)
	$HoverSFX.play()

func _on_Play_pressed():
	$SelectSFX.play()
	get_tree().change_scene("res://Scenes/main.tscn")

func _on_Play2_pressed():
	get_tree().change_scene("res://Scenes/2PM.tscn")
	$SelectSFX.play()

func _on_Quit_pressed():
	get_tree().quit()

func _on_Options_pressed():
	$SelectSFX.play()
