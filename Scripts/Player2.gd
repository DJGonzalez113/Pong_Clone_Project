extends StaticBody2D


const SPEED = 500
var window_h
var paddle_h


# Called when the node enters the scene tree for the first time.
func _ready():
	window_h = get_viewport_rect().size.y
	paddle_h = $Sprite.texture.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	
	position.y = clamp(position.y, paddle_h/2, window_h - paddle_h/2)
