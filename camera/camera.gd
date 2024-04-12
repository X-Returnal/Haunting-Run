extends Camera2D
@export
var limit = Vector4(0,0,500,500)
@export
var speed = 600
var buffer = [0,0]
# Called when the node enters the scene tree for the first time.
func _ready():
	limit_left = limit.x
	limit_top = limit.y
	limit_right = limit.z
	limit_bottom = limit.w
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left","right","up","down")
	position += direction*speed*delta
	#get half of screensize to prevent the from geting stuck on the side
	buffer[0] = get_viewport_rect().size.x/2
	buffer[1] = get_viewport_rect().size.y/2
	if position.x < limit_left+buffer[0]:
		position.x = limit_left+buffer[0]
	if position.x > limit_right-buffer[0]:
		position.x = limit_right-buffer[0]
	if position.y > limit_bottom-buffer[1]:
		position.y = limit_bottom-buffer[1]
	if position.y < limit_top+buffer[1]:
		position.y = limit_top+buffer[1]
