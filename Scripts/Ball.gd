extends KinematicBody2D


const INIT_SPEED = 500
const ACCL = 10
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
	move_and_collide(dir * speed * delta)

func rand_dir():
	var new_dir := Vector2()
	randomize()
	new_dir.x = [-1, 1][randi() % 2]
	new_dir.y = [-0.4, 0.4][randi() % 2]
	return new_dir.normalized()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BallTimer_timeout():
	new_ball()
