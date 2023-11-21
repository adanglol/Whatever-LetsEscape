# Inventory.gd
extends Node

# AutoLoad singleton
func _ready():
	set_process(false)  # Disable process, as it's not needed for an inventory

var items : Array = []

func add_item(item_id: String):
	items.append(item_id)

func remove_item(item_id: String):
	if items.find(item_id) != -1:
		items.erase(items.find(item_id))
func remove_all():
	items.clear()

func has_item(item_id: String) -> bool:
	return items.find(item_id) != -1
