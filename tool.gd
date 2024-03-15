extends Button
@export var toolid = []
signal select(data)

func sd():
	queue_free()
func _pressed():
	select.emit(toolid)
