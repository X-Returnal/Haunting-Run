extends Node2D

var current_goals = [9999]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_goal(goal:int):
	if current_goals == [9999]:
		current_goals = [goal]
		return
	current_goals += goal

func 
