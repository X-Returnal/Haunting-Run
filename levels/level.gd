extends Node2D

#just realized that this can be set to a non empty string to make levels impossible. feature.
@export var current_goals = [""]

# player resource to solve level
# format: x move(float), jump(bool), amount(int)
@export
var toolbox = [[1.0,true,1],[-.5,false,1],[-1.0, true,1]]
var has_won = false



func set_goal(goal:String):
	if current_goals == [""]:
		current_goals = [goal]
		return
	current_goals += goal

func clear_goal(goal:String):
	current_goals=current_goals.filter(func(cgoal): return cgoal != goal)


func _on_finish_check_delay_timeout():
	#check if goals is a empty list (relatable)
	if !current_goals:
		# TODO: win()
		has_won = true
