extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var SPRINT_SPEED = 10.0
var inventory = Inventory

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck := $Neck
@onready var camera := $Neck/Camera3D

func _unhandled_input(event: InputEvent) -> void:
	# Handle mouse capture.
	if event is InputEventMouseMotion:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	# handle escape key uncapture mouse.
	# elif event.is_action_pressed("ui_cancel"):
	# 	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)	
	# Handle camera rotation after mouse capture.
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			# Limit the camera rotation.
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_foward", "move_back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if Input.is_action_pressed("sprint"):
			velocity.x = direction.x * SPRINT_SPEED
			velocity.z = direction.z * SPRINT_SPEED
		else:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	

	move_and_slide()

	




func _on_area_3d_body_entered(_body):
	print("DKFJLSDFKJKSDLFJDSLKFJD")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	call_deferred("change_hallway")

func change_hallway():
	get_tree().change_scene_to_file("res://Scenes/Hallway.tscn")


func _on_book_body_entered(body):
	print("player touched book")
	inventory.gotGardenKey = true
	print(inventory.gotGardenKey)
	# body.queue_free()
