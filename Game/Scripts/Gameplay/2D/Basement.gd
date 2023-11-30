# Basement Scene 

# BasementScene.gd
extends Node2D

var inventory = Inventory
var key = null
var key2 = null
var key3 = null
var key4 = null
var key5 = null
var inventoryUI = null
var door = null
var bgUI = null
var key1 = null
# var key2 = null
# var key3 = null
# var key4 = null
# var key5 = null
var boxOpen = false
var boxOpenSprite = null

func _ready():
	print("Inside Basement Scene")
	key = get_node("key")
	key2 = get_node("key_2")
	key3 = get_node("key_3")
	key4 = get_node("key_4")
	key5 = get_node("key_5")
	door = get_node("Door")
	inventoryUI = get_node("inventoryUI")
	bgUI = get_node("UIbg")
	inventoryUI.visible = false
	# IMPLEMENT CHANGING SPRITES FOR KEY WHEN ASSETS COME IN 


	key1 = inventoryUI.get_node("Slot1").get_node("key1").get_node("Area2D")
	print(key1)
	# print(key1.body)
	# keyTwo = inventoryUI.get_node("Slot2").get_node("key2")
	# keyThree = inventoryUI.get_node("Slot3").get_node("key3")
	# keyFour = inventoryUI.get_node("Slot4").get_node("key4")
	# keyFive = inventoryUI.get_node("Slot5").get_node("key5")

	boxOpenSprite = get_node("Box")
	print(boxOpenSprite)	

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
	inventoryUI.get_child(0).visible = true
	key.queue_free()

func key2_clicked():
	print("Key 2 has been picked up")
	key2.visible = false
	inventory.add_item("key2")
	print(inventory.items)
	inventoryUI.get_child(1).visible = true
	key2.queue_free()

func key3_clicked():
	print("Key 3 has been picked up")
	key3.visible = false
	inventory.add_item("key3")
	print(inventory.items)
	inventoryUI.get_child(2).visible = true
	key3.queue_free()

func key4_clicked():
	print("Key 4 has been picked up")
	key4.visible = false
	inventory.add_item("key4")
	print(inventory.items)
	inventoryUI.get_child(3).visible = true
	key4.queue_free()
	

func key5_clicked():
	print("Key 5 has been picked up")
	key5.visible = false
	inventory.add_item("key5")
	print(inventory.items)
	inventoryUI.get_child(4).visible = true
	key5.queue_free()


func _process(delta):
	if Input.is_action_just_pressed("toggle_inventory"):
		print("Inventory has been toggled tab has been pressed")
		toggle_ui_visibility()
		
func toggle_ui_visibility():
	if inventoryUI.visible == false:
		inventoryUI.visible = true
		bgUI.visible = true
	else:
		inventoryUI.visible = false
		bgUI.visible = false

func _on_key_1_key_touching_door():
	print("Key 1 is touching the door not it ")


func _on_key_2_key_touching_door():
	print("Key 2 is touching the door not it ")


func _on_key_3_key_touching_door():
	print("Looks like you found the right key")
	get_tree().change_scene_to_file("res://Scenes/Hallway.tscn")


func _on_key_4_key_touching_door():
	print("Key 4 is touching the door not it ")


func _on_key_5_key_touching_door():
	print("Key 5 is touching the door not it ")
