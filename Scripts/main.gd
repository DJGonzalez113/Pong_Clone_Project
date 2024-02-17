extends Node2D


var p_score = 0
var cpu_score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$HUD/PlayerScore.text = str(p_score)
	$HUD/CPUScore.text = str(cpu_score)

func _on_LeftGoal_body_entered(body):
	cpu_score += 1
	score_process()

func _on_RightGoal_body_entered(body):
	p_score += 1
	score_process()

func score_process():
	$ScoreSFX.play()
	$BallTimer.start()
