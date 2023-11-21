# ClickableSprite2D.gd
extends Sprite2D

signal clicked

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if get_rect().has_point(to_local(event.position)):
				on_click()

func on_click():
	print("Clicked!")
	emit_signal("clicked")




func _on_clicked():
	pass # Replace with function body.
