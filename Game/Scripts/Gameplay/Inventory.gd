# Inventory.gd
extends Node

signal item_added(item_id: String)
signal item_removed(item_id: String)

# AutoLoad singleton
func _ready():
	set_process(false)  # Disable process, as it's not needed for an inventory

var items : Array = []

func add_item(item_id: String):
	items.append(item_id)
	emit_signal("item_added", item_id)

func remove_item(item_id: String):
	if item_id in items:
		items.erase(items.find(item_id))
		emit_signal("item_removed", item_id)

func remove_all():
	items.clear()

func has_item(item_id: String) -> bool:
	return item_id in items
