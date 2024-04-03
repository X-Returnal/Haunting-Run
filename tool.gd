extends Button
# format: x move(float), jump(bool), amount(int), tool button [this scene](node)
@export var toolid = []
@export var unit_spawn:PackedScene
signal select(data)

func tool_selfdestruct():
	queue_free()


func _pressed():
	#Use another singal to send data :thumbsup:
	select.emit(toolid)

func update_amount():
	#small func to reduce cross script messiness by 1
	text = str(toolid[2])

func load_tool():
	var area = unit_spawn.instantiate()
	add_child(area)
	area.modx = toolid[0]
	area.modjump = toolid[1]
	area.functon = false
	area.istool = true
	area._ready()
	text = str(toolid[2])
	#FIXME: let me do my warcrimes to programing
	toolid.insert(get_tree().get_current_scene(),3)
