# upstairs Hallway script Leads to Bedroom and Altar

extends Node2D

var downstairs = null
var bedroomDoor = null
var altarDoor = null
var inventory = Inventory

func _ready():
	print("Hallway Script Running")
	downstairs = get_node("Downstairs")
	bedroomDoor = get_node("BedroomDoor")
	altarDoor = get_node("AltarDoor")
	


func _on_downstairs_clicked():
	get_tree().change_scene_to_file("res://Scenes/Hallway.tscn")


func _on_bedroom_door_clicked():
	if inventory.gotBedroomKey == true:
		get_node("Unlocked").visible = true
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://Scenes/Bedroom.tscn")
	else:
		print("looks like the door is locked")
		get_node("Locked").visble = true
		await get_tree().create_timer(2.0).timeout
		get_node("Locked").visible = false


func _on_altar_door_clicked():
	if inventory.gotAltarKey == true:
		get_node("Unlocked").visible = true
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://Scenes/Altar.tscn")
	else:
		print("Looks like door is locked")
		get_node("Locked").visible = true
		await get_tree().create_timer(2.0).timeout
		get_node("Locked").visible = false
