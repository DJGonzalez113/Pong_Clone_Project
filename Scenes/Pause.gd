extends Control


var is_paused: bool


# Called when the node enters the scene tree for the first time.
func _ready():
	set_is_paused(false)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		is_paused = !is_paused
		set_is_paused(is_paused)

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_Return_pressed():
	set_is_paused(false)


func _on_Options_pressed():
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
