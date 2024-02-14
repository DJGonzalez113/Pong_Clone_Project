extends StaticBody2D


const SPEED = 500
var win_height
var p_height


# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $Sprite.texture.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	
	position.y = clamp(position.y, p_height/2, win_height - p_height/2)
