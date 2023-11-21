# Basement Scene 

# BasementScene.gd
extends Node2D

var inventory = Inventory
var key = null
var key2 = null
var key3 = null
var key4 = null
var key5 = null
var boxOpen = false

func _ready():
	print("Inside Basement Scene")
	key = get_node("key")
	key2 = get_node("key_2")
	key3 = get_node("key_3")
	key4 = get_node("key_4")
	key5 = get_node("key_5")

	

func open_box():
	print("Box has been opened")
	if boxOpen == false:
		boxOpen = true
		# set keys to visible
		key.visible = true
		key2.visible = true
		key3.visible = true
		key4.visible = true
		key5.visible = true
	
func key_clicked():
	print("Key 1 has been picked up")
	key.visible = false
	inventory.add_item("key1")
	print(inventory.items)
	inventory.remove_all()
	print(inventory.items)

func key2_clicked():
	print("Key 2 has been picked up")
	key2.visible = false

func key3_clicked():
	print("Key 3 has been picked up")
	key3.visible = false

func key4_clicked():
	print("Key 4 has been picked up")
	key4.visible = false

func key5_clicked():
	print("Key 5 has been picked up")
	key5.visible = false
	
