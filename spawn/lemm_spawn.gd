extends Node2D
@export
var progress_speed:float = 15
@export
var unit_spawn:PackedScene
@export
var limit_spawn:int = 3

var progress:float = 0
var spawned:int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spawned < limit_spawn or limit_spawn < 0:
		progress += progress_speed*delta
		if progress > 100:
			var lemm = unit_spawn.instantiate()
			owner.add_child(lemm)
			lemm.transform = $Marker2D.global_transform
			spawned+=1
			progress = 0



func reset():
	spawned = 0
	progress = 0
