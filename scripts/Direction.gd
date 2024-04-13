extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if input_direction.y > 0: #walking "downward"
		rotation_degrees = 0
	elif input_direction.y < 0:
		rotation_degrees = 180
		# Flip the sprite based on the input direction
	elif input_direction.x != 0:
		if input_direction.x > 0:
			rotation_degrees = -90
		else:
			rotation_degrees = 90
