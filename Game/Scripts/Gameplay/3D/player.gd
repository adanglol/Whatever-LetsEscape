extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# update method equivalent
func _process(delta):
	# input tell vector where go left right up down
	var input := Vector3.ZERO
	# x val lio when press d key -1 a key 0 niether or both presed 
	input.x = Input.get_axis("move_left", "move_right")
	input.z = Input.get_axis("move_foward", "move_back")

	apply_central_force(input * 1200 * delta)



