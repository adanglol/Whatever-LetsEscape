extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset : Vector2
var original_position : Vector2

signal key_touching_door

func _ready():
	original_position = position


func _process(delta):
	if draggable:

		# if Input.is_action_just_pressed("click"):
		# 	offset = get_global_mouse_position() - position
		# 	Global.is_dragging = true
		# if Input.is_action_pressed("click"):
		# 	position = get_global_mouse_position() - offset
		# if Input.is_action_just_released("click"):
		# 	Global.is_dragging = false

		if Input.is_action_just_pressed("click"):
			draggable = false
			Global.is_dragging = false
			position = original_position
		else:
			draggable = true
			Global.is_dragging = true
			position = get_global_mouse_position() - offset
# hover effect
func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
		print("hover")
		draggable = true
		scale = Vector2(1.2, 1.2)
		offset = get_global_mouse_position() - position
# unhover effect
func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)



func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group("door"  ):
		is_inside_dropable = true
		body_ref = body
		print("body entered")
		print(body_ref)
		print(body_ref.global_position)
		print("a key is touching the door")
		emit_signal("key_touching_door")
		
		
		

func _on_area_2d_body_exited(body):
	print("body exited")


