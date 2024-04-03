extends Area2D

@export var modon = true
@export var modx = 0.0
@export var modjump = false
@export var isgoal = false
@export var isdeath = false
@export var istool = false
@export var functon = true

@export var lemm_count = 0
@export var generic_goal = 0

@export var win_str = "add details on how to complete"


func _ready():
	$Director1.set_visible(false)
	$Director2.set_visible(false)
	if isgoal:
		$/root/level.set_goal(win_str)
	if modon:
		$Director0.set_visible(true)
		if modjump:
			$Director1.set_visible(true)
			$Director1.rotation = modx
		else:
			$Director2.set_visible(true)
			$Director2.rotation = modx
	if istool:
		add_to_group("tool")
	monitoring = functon

func tool_selfdestruct():
	queue_free()
func _on_body_entered(body):
	if body.is_in_group("lemm"):
		lemm_count += 1
		if modon:
			body.x_direction = modx
			body.jumping = modjump
		if isgoal:
			if lemm_count >= generic_goal:
				$/root/level.clear_goal(win_str)
				
			body.die()
		if isdeath:
			body.die()
			
			
func reset():
	lemm_count = 0

