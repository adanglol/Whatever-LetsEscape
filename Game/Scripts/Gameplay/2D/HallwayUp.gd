# upstairs Hallway script Leads to Bedroom and Altar

extends Node2D

var downstairs = null

func _ready():
	print("Hallway Script Running")
	downstairs = get_node("Downstairs")
	


func _on_downstairs_clicked():
	get_tree().change_scene_to_file("res://Scenes/Hallway.tscn")
