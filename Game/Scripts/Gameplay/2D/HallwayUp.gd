# upstairs Hallway script Leads to Bedroom and Altar

extends Node2D

var downstairs = null
var bedroomDoor = null
var altarDoor = null

func _ready():
	print("Hallway Script Running")
	downstairs = get_node("Downstairs")
	bedroomDoor = get_node("BedroomDoor")
	altarDoor = get_node("AltarDoor")
	


func _on_downstairs_clicked():
	get_tree().change_scene_to_file("res://Scenes/Hallway.tscn")


func _on_bedroom_door_clicked():
	pass # Replace with function body.


func _on_altar_door_clicked():
	pass # Replace with function body.
