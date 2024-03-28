extends Control
var active_tool = []
var scene = preload("res://tool.tscn")
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
	
func fill_toolbox():
	
	for toolset in $"../..".toolbox:
		var instance = scene.instantiate()
		$"edit menu/toolbox".add_child(instance)
		instance.select.connect(on_button_select)
		instance.toolid = toolset
		instance.load_tool()

func resettools():
	#nuke current tool buttons
	get_tree().call_group("tool","sd")
	#and replace them with fresh
	fill_toolbox()
func on_button_select(data):
	active_tool = data
