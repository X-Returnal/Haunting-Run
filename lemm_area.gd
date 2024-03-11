extends Area2D

@export var modon = true
@export var modx = 0.0
@export var modjump = false
@export var isgoal = false
@export var isdeath = false

@export var lemm_count = 0
@export var generic_goal = 0

@export var win_int = 0


func _ready():
	
	if isgoal:
		$"..".set_goal(win_int)



func _on_body_entered(body):
	if body.is_in_group("lemm"):
		lemm_count += 1
		if modon:
			body.x_direction = modx
			body.jumping = modjump
		if isgoal:
			if lemm_count> generic_goal:
				$"..".clear_goal(win_int)
				
			body.die()
		if isdeath:
			body.die()
