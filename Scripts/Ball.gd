extends KinematicBody2D


const INIT_SPEED = 500
const ACCL = 30
const MAX_Y_VECTOR : float = 0.6
var window
var speed : int
var dir : Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	window = get_viewport_rect().size
	
# Called when timer times out to reset the ball in the center
func new_ball():
	randomize()
	position.x = window.x/2
	position.y = window.y/2
	speed = INIT_SPEED
	dir = rand_dir()

func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider == get_parent().get_node("Player") or collider == get_parent().get_node("CPU"):
			speed += ACCL
			dir = new_dir(collider)
		else:
			dir = dir.bounce(collision.get_normal())

func rand_dir():
	var new_dir := Vector2()
	randomize()
	new_dir.x = [-1, 1][randi() % 2]
	new_dir.y = [-0.4, 0.4][randi() % 2]
	return new_dir.normalized()

func new_dir(collider):
	var ball_y = position.y
	var paddle_y = collider.position.y
	var dist = ball_y - paddle_y
	var new_dir := Vector2()
	
	if dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	new_dir.y = (dist / (collider.paddle_h / 2)) * MAX_Y_VECTOR
	return new_dir.normalized()


func _on_BallTimer_timeout():
	new_ball()
