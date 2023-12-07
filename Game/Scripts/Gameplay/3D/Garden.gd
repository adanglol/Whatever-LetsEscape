# garden level

extends Node3D

var shovelText = null

func _ready():
	print("Hello from the garden level")
	shovelText = get_node("PlayerNode").get_node("Player").get_node("Neck").get_node("Camera3D").get_node("ShovelText")
	print(shovelText)
