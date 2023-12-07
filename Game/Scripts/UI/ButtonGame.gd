extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	# Access TimerSingleton and start the timer

	# 1200
	get_tree().change_scene_to_file("res://Scenes/Basement.tscn")
	var timer_singleton = TimerManager.instance
	timer_singleton.start_timer(1200)
