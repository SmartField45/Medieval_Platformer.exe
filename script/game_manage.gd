extends Node

var score = 0#Default score
@onready var score_label: Label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = 'You Collected ' + str(score) + ' Coins! '
	#var score = 0 -> integer
	#str(score) -> string
