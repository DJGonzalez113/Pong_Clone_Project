extends StaticBody2D


const SPEED = 500
var ball_pos : Vector2
var dist
var move_by
var window_h
var paddle_h

# Called when the node enters the scene tree for the first time.
func _ready():
	window_h = get_viewport_rect().size.y
	paddle_h = $Sprite.texture.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ball_pos = get_parent().get_node("Ball").position
	dist = position.y - ball_pos.y
	
	if abs(dist) > SPEED * delta:
		move_by = SPEED * delta * (dist / abs(dist))
	else:
		move_by = dist
	
	position.y -= move_by
	
	position.y = clamp(position.y, paddle_h/2, window_h - paddle_h/2)
