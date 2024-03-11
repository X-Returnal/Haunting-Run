extends Camera2D
@export
var limit = Vector4(0,0,500,500)
@export
var speed = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	limit_left = limit.x
	limit_top = limit.y
	limit_right = limit.z
	limit_bottom = limit.w

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left","right","up","down")
	position += direction*speed 
