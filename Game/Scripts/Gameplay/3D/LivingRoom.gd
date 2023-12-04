# living room where we discover lore and get key to garden

extends Node3D
var fadeOut = null

func _ready():
	print("living room ready")
	fadeOut = get_node("fadeOut")


# func _on_hallway_clicked():
# 	fadeOut.visible = true
# 	await get_tree().create_timer(1.0).timeout
# 	get_tree().change_scene_to_file("res://scenes/Hallway.tscn")
