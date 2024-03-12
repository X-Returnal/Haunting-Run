extends Node2D

@export var current_goals = [""]
var has_won = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func set_goal(goal:String):
	if current_goals == [""]:
		current_goals = [goal]
		return
	current_goals += goal

func clear_goal(goal:String):
	current_goals=current_goals.filter(func(cgoal): return cgoal != goal)


func _on_finish_check_delay_timeout():
	
	if !current_goals:
		# TODO: win()
		has_won = true
