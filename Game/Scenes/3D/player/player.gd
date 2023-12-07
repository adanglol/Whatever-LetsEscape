extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var SPRINT_SPEED = 10.0
var inventory = Inventory
var hasShovel = false
var inShovelArea = false
var hasBeeSmoker = false
var inBeeSmokerArea = false
var inTreeArea = false

var inMound1 = false
var inMound2 = false
var inMound3 = false
var inMound4 = false
var inMound5 = false
var inMound6 = false
var inMound7 = false
var inMound8 = false
var inMound9 = false
var inMound10 = false

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
	
	if Input.is_action_just_pressed("interact") and !hasShovel and inShovelArea:
		print("Player picked up shovel")
		hasShovel = true
		print(hasShovel)
		# Getting Shovel Object from Garden Level Node and removing it
		get_parent().get_parent().get_node("shovel").queue_free()
		# Put shovel in hand
		get_node("Neck/Camera3D/shovel2").show()
	
	if Input.is_action_just_pressed("interact") and !hasBeeSmoker and inBeeSmokerArea:
		print("Player picked up bee smoker")
		hasBeeSmoker = true
		print(hasBeeSmoker)
		# Getting Bee Smoker Object from Garden Level Node and removing it
		get_parent().get_parent().get_node("garden bee smoker").queue_free()
		# hide shovel
		get_node("Neck/Camera3D/shovel2").hide()
		# Put bee smoker in hand
		get_node("Neck/Camera3D/garden bee smoker2").show()
	
	if Input.is_action_just_pressed("interact") and inTreeArea and hasBeeSmoker:
		print("Player smoked bees")
		get_node("Neck/Camera3D/TreeText").queue_free()
		get_parent().get_parent().get_node("bee hive").queue_free()
		get_parent().get_parent().get_node("KeyLight").show()
		await get_tree().create_timer(2.0).timeout
		get_parent().get_parent().get_node("garden key").show()
		await get_tree().create_timer(2.0).timeout
		get_parent().get_parent().get_node("garden key").queue_free()
		get_node("Neck/Camera3D/KeyText").show()
		inventory.gotBedroomKey = true
	
	if Input.is_action_just_pressed("interact") and hasShovel:
		if inMound1 and get_parent().get_parent().get_node("DirtMoundFirstTop"):
			get_parent().get_parent().get_node("DirtMoundFirstTop").queue_free()
		elif inMound2 and get_parent().get_parent().get_node("DirtMoundSecondTop"):
			get_parent().get_parent().get_node("DirtMoundSecondTop").queue_free()
		elif inMound3 and get_parent().get_parent().get_node("DirtMoundThirdTop"):
			get_parent().get_parent().get_node("DirtMoundThirdTop").queue_free()
		elif inMound4 and get_parent().get_parent().get_node("DirtMoundFourthTop"):
			get_parent().get_parent().get_node("DirtMoundFourthTop").queue_free()
		elif inMound5 and get_parent().get_parent().get_node("DirtMoundFifthTop"):
			get_parent().get_parent().get_node("DirtMoundFifthTop").queue_free()
		elif inMound6 and get_parent().get_parent().get_node("DirtMoundSixthTop"):
			get_parent().get_parent().get_node("DirtMoundSixthTop").queue_free()
		elif inMound7 and get_parent().get_parent().get_node("DirtMoundSevenTop"):
			get_parent().get_parent().get_node("DirtMoundSevenTop").queue_free()
		elif inMound8 and get_parent().get_parent().get_node("DirtMoundEightTop"):
			get_parent().get_parent().get_node("DirtMoundEightTop").queue_free()
			get_parent().get_parent().get_node("BeeSmokerArea").visible = true
		elif inMound9 and get_parent().get_parent().get_node("DirtMoundNineTop"):
			get_parent().get_parent().get_node("DirtMoundNineTop").queue_free()
		elif inMound10 and get_parent().get_parent().get_node("DirtMoundTenTop"):
			get_parent().get_parent().get_node("DirtMoundTenTop").queue_free()
		
		

		
	

	

	move_and_slide()

	




func _on_area_3d_body_entered(body):
	print("DKFJLSDFKJKSDLFJDSLKFJD")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	call_deferred("change_hallway")

func change_hallway():
	get_tree().change_scene_to_file("res://Scenes/Hallway.tscn")


func _on_book_body_entered(body):
	print("player touched book")
	inventory.gotGardenKey = true
	print(inventory.gotGardenKey)
	get_node("Neck/Camera3D/Book").show()
	# body.queue_free()


func _on_shovel_area_body_entered(body):
	print("player near shovel")
	if hasShovel == false:
		get_node("Neck/Camera3D/ShovelText").show()
	inShovelArea = true

		


func _on_shovel_area_body_exited(body):
	get_node("Neck/Camera3D/ShovelText").hide()
	inShovelArea = false


func _on_tree_area_body_entered(body):
	print("player enteered tree area")
	if hasBeeSmoker and get_node("Neck/Camera3D/TreeText") != null:
		get_node("Neck/Camera3D/TreeText").show()
	else:
		get_node("Neck/Camera3D/HiveText").show()
	
	inTreeArea = true



func _on_bee_smoker_area_body_entered(body):
	if get_parent().get_parent().get_node("BeeSmokerArea").visible == true:
		print("player entered bee smoker area")
		if hasBeeSmoker == false and get_node("Neck/Camera3D/TreeText") != null:
			get_node("Neck/Camera3D/BeeSmokerText").show()
		inBeeSmokerArea = true


		


func _on_bee_smoker_area_body_exited(body):
	get_node("Neck/Camera3D/BeeSmokerText").hide()
	inBeeSmokerArea = false


func _on_tree_area_body_exited(body):
	get_node("Neck/Camera3D/HiveText").hide()
	if get_node("Neck/Camera3D/TreeText"):
		get_node("Neck/Camera3D/TreeText").hide()
	inTreeArea = false


func _on_mound_area_1_body_entered(body):
	print("touched mound1")
	inMound1 = true
	dig_text()
	


func _on_mound_area_body_exited(body):
	print("exit mound")
	if hasShovel:
		get_node("Neck/Camera3D/DigText").hide()		
	else:
		get_node("Neck/Camera3D/DigText2").hide()


func dig_text():
	if hasShovel:
		get_node("Neck/Camera3D/DigText").show()		
	else:
		get_node("Neck/Camera3D/DigText2").show()



func _on_mound_area_2_body_entered(body):
	print("touched mound2")
	inMound2 = true
	dig_text()


func _on_mound_area_3_body_entered(body):
	print("touched mound3")
	inMound3 = true
	dig_text()


func _on_mound_area_4_body_entered(body):
	print("touched mound4")
	inMound4 = true
	dig_text()


func _on_mound_area_5_body_entered(body):
	print("touched mound5")
	inMound5 = true
	dig_text()


func _on_mound_area_6_body_entered(body):
	print("touched mound6")
	inMound6 = true
	dig_text()


func _on_mound_area_7_body_entered(body):
	print("touched mound7")
	inMound7 = true
	dig_text()


func _on_mound_area_8_body_entered(body):
	print("touched mound8")
	inMound8 = true
	dig_text()


func _on_mound_area_9_body_entered(body):
	print("touched mound9")
	inMound9 = true
	dig_text()


func _on_mound_area_10_body_entered(body):
	print("touched mound10")
	inMound10 = true
	dig_text()
