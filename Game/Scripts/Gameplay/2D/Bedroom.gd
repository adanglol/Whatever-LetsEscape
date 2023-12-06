# Bedroom scene where get key to altar

extends Node2D

var glass = null
var key = null
var fadeOut = null
var text = null
var text2 = null
var inventory = Inventory

func _ready():
	print("Bedroom scene ready")
	glass = get_node("Glass")
	key = get_node("Key")
	fadeOut = get_node("fadeOut")
	text = get_node("Text")
	text2 = get_node("SecondText")



func _on_glass_clicked():
	print("glass clicked")
	glass.queue_free()
	key.visible = true


func _on_key_clicked():
	if key.visible == true:
		text.queue_free()
		text2.visible = true
		inventory.gotAltarKey = true
		print("got altar key")
		key.queue_free()
		await get_tree().create_timer(3.0).timeout
		fadeOut.visible = true
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/HallwayUp.tscn")

		
		

