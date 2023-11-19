
extends Button

func _on_pressed():
	print("Button pressed!")
	# change scene
	get_tree().change_scene_to_file("res://Scenes/Basement.tscn")
	
	# Access TimerSingleton and start the timer
	var timer_singleton = TimerManager
	timer_singleton.start_timer(5.0)
