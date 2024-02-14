extends StaticBody2D


const SPEED = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
