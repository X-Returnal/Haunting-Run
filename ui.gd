extends Control
var tools = []
var scene = preload("res://tool.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	fill_toolbox()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$progress.text = "Goals:"
	if $"../..".has_won:
		$victory.visible=true
	for goal_txt in $"../..".current_goals:
		$progress.text+="\n"+goal_txt
func fill_toolbox():
	for toolset in $"../..".toolbox:
		var instance = scene.instantiate()
		$HBoxContainer.add_child(instance)
		instance.toolmodx = toolset[0]
		instance.tooljump = toolset[1]
		instance.toolamount = toolset[2]

