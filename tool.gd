extends Button
@export var toolmodx = 0.0
@export var tooljump = true
@export var toolamount = 1
@export var active = false


func _pressed():
	active = true
func sd():
	queue_free()
