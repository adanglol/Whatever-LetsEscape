# Hallway Scene Leads to Upstairs Hallway, Living Room, and Garden - need key from living room to open door to garden

extends Node2D

var fadeOut = null
var gardenDoor = null
var upstairsDoor = null
var livingRoomDoor = null
var new_texture : Texture = preload("res://Assets/Basement/Door Unlock.png") 


func _ready():
	print("Hallway Scene Ready")
	fadeOut = get_node("fadeOut")
	upstairsDoor = get_node("UpstairsDoor")
	livingRoomDoor = get_node("LivingRoomDoor")

func _on_garden_door_clicked():
	print("Garden Door Clicked")


func _on_upstairs_door_clicked():
	upstairsDoor.texture = new_texture
	await get_tree().create_timer(1.0).timeout
	fadeOut.visible = true
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Scenes/HallwayUp.tscn")

func _on_living_room_door_clicked():
	fadeOut.visible = true
	await get_tree().create_timer(1.0).timeout
	# get_tree().change_scene_to_file("res://Scenes/LivingRoom.tscn")
