extends Control
# format: x move(float), jump(bool), amount(int),tool button (node)
var active_tool = []
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
	#only clicks
	#NOTE: maybe add removal on right click?
	if event == InputEventMouseButton:
		
		if active_tool == []:
			#cant place nothing
			return
		if active_tool[2] <= 0:
			#out of tools there
			return
		#all checks clear, time to place.
		var director = unit_spawn.instantiate()
		$"../..".add_child(director)
		director.transform = get_global_mouse_position()
		director.modx = active_tool[0]
		director.modjump = active_tool[1]
		director.istool = true
		director._ready()
		# and decrease values
		active_tool[2] -= 1
		# oh god i just realized what i did oh eugh grose
		active_tool[3].toolid[2] -= 1
		active_tool[3].update_amount()
		

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
	#refill the now empty toolbox
	fill_toolbox()



func on_button_select(data):
	#jank to get tool button data
	active_tool = data


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
