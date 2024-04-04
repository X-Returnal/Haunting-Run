extends Control
# format: x move(float), jump(bool), amount(int),tool button (node)
var active_tool = []
var active_node:Node
var scene = preload("res://tool.tscn")
@export var unit_spawn:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	fill_toolbox()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"play menu/progress".text = "Goals:"
	if $"../..".has_won:
		$"play menu/victory".visible=true
	for goal_txt in $"../..".current_goals:
		$"play menu/progress".text+="\n"+goal_txt
	
	
	
func _input(event):
	#Player imput:
	#print("thait a imput")
	#only clicks
	
	#NOTE: maybe add removal on right click?
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("it a clic")
		if active_tool == []:
			print("select something dummy")
			#cant place nothing
			return
		if active_tool[2] <= 0:
			print("out of stuff")
			#out of tools there
			return
		if get_global_mouse_position()<$"edit menu/minimum_bound".position and get_global_mouse_position()>$"edit menu/maximum_bound".position:
			print("click in the bounds")
			return
		if !get_tree().paused:
			print("go to the edit menu to edit")
			return
		
		#all checks clear, time to place.
		var director = unit_spawn.instantiate()
		$"../..".add_child(director)
		director.position = get_global_mouse_position()
		director.modx = active_tool[0]
		director.modjump = active_tool[1]
		director.istool = true
		director._ready()
		# and decrease values
		active_tool[2] -= 1
		
		active_node.toolid[2] -= 1
		active_node.update_amount()
		return

func fill_toolbox():
	
	for toolset in $"../..".toolbox:
		var instance = scene.instantiate()
		$"edit menu/toolbox".add_child(instance)
		instance.select.connect(on_button_select)
		instance.toolid = toolset
		instance.load_tool()

func resettools():
	#nuke current tool buttons and placed tools
	get_tree().call_group("tool","tool_selfdestruct")
	active_node = null
	active_tool = []
	#refill the now empty toolbox
	fill_toolbox()



func on_button_select(data,node):
	#jank to get tool button data
	active_tool = data
	active_node = node


func reset_play():
	get_tree().call_group("spawner","reset")
	get_tree().call_group("lemm","queue_free")
	get_tree().call_group("area","reset")


func toggle_pause():
	#
	get_tree().paused = !get_tree().paused
	
	if get_tree().paused:
		$"edit menu".show()
		$"play menu".hide()
	else:
		$"play menu".show()
		$"edit menu".hide()
