extends Node2D


var p1_score = 0
var p2_score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$HUD/P1Score.text = str(p1_score)
	$HUD/P2Score.text = str(p2_score)

func _on_LeftGoal_body_entered(body):
	p2_score += 1
	score_process()

func _on_RightGoal_body_entered(body):
	p1_score += 1
	score_process()

func score_process():
	$ScoreSFX.play()
	$BT2.start()
