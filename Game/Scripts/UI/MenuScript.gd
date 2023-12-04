
extends Sprite2D

signal play_game

signal quit_game

signal credits


func _ready():
	print("Ready!")
	set_process_input(true)
	# mouse_filter = MOUSE_FILTER_IGNORE_CHILDREN

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if get_rect().has_point(to_local(event.position)):
			if name == "Play":
				emit_signal("play_game")
			elif name == "Quit":
				emit_signal("quit_game")
			elif name == "Credits":
				emit_signal("credits")
	
			
			
			

func _on_play_game():
	print("Play Game!")
	# change scene
	get_tree().change_scene_to_file("res://Scenes/Basement.tscn")	
	# Access TimerSingleton and start the timer
	var timer_singleton = TimerManager
	timer_singleton.start_timer(5)


func _on_credits():
	print("Credits!")


func _on_quit_game():
	print("Quit Game")
	get_tree().quit()
