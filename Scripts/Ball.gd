extends KinematicBody2D


const INIT_SPEED = 500
const ACCL = 10
var window
var speed
var dir
var rand


# Called when the node enters the scene tree for the first time.
func _ready():
	window = get_viewport_rect().size
	
# Called when timer times out to reset the ball in the center
func new_ball():
	rand.randomize()
	position.x = window.x/2
	position.y = rand.randi_range(250, window.y - 250)
	speed = INIT_SPEED
	dir = rand_dir()

func _physics_process(delta):
	move_and_collide(dir * speed * delta)

func rand_dir():
	var new_dir
	rand.randomize()
	new_dir.x = rand.randi_range(1, -1)
	new_dir.y = rand.randf_range(1, -1)
	return new_dir.normalized()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
