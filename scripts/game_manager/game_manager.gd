extends Node

var score: int = 0
@export var _score_label: Label = null

func add_point():
	score += 1
	_score_label.text = str(score)
