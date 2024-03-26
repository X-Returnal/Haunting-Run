extends Button
# format: x move(float), jump(bool), amount(int)
@export var toolid = []
@export var unit_spawn:PackedScene
signal select(data)
func _ready():
	pass
func sd():
	queue_free()
func _pressed():
	select.emit(toolid)
func load_tool():
	var b = unit_spawn.instantiate()
	add_child(b)
	b.modx = toolid[0]
	b.modjump = toolid[1]
	b.functon = false
	b._ready()
