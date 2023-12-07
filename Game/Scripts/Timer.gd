
# TimerManager.gd
extends Node

# Singleton instance
var instance : TimerManager = null

# Timer properties
var current_time : int = 0
var is_running : bool = false
var accumulated_time : float = 0  # To accumulate time until it reaches a whole second

# Signal emitted when the timer reaches zero
signal timeout_signal

func _ready():
	if instance == null:
		instance = self
		set_process(false)  # Initially disable the _process callback
		pass
	else:
		queue_free()  # If an instance already exists, delete this one

# Start the timer with a given duration in seconds
func start_timer(duration: int):
	current_time = duration
	is_running = true
	set_process(true)  # Enable processing when the timer starts

# Process function called every frame
func _process(delta):
	if is_running:
		accumulated_time += delta
		if accumulated_time >= 1.0:  # Check if at least one second has passed
			current_time -= 1
			accumulated_time -= 1.0

			print("Time remaining: " + str(current_time))

			if current_time <= 0:
				current_time = 0
				is_running = false
				set_process(false)  # Stop processing once the timer reaches zero
				handle_timeout()  # Handle timeout directly in TimerManager

# Get the current time remaining on the timer
func get_time():
	return current_time

# Handle timeout behavior
func handle_timeout():
	await get_tree().create_timer(1.0).timeout
	print("Game Over! Time's up!")
	emit_signal("timeout_signal")  # Emit the timeout signal
	get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	

#  --------------------------------------------------------------------------------
# Implementation of timer using floats 
#  --------------------------------------------------------------------------------

# # TimerManager.gd
# extends Node

# # Singleton instance
# var instance : TimerManager = null

# # Timer properties
# var current_time : float = 0
# var is_running : bool = false

# # Signal emitted when the timer reaches zero
# signal timeout_signal

# func _ready():
# 	if instance == null:
# 		instance = self
# 		set_process(false)  # Initially disable the _process callback
# 		pass
# 	else:
# 		queue_free()  # If an instance already exists, delete this one

# # Start the timer with a given duration
# func start_timer(duration: float):
# 	current_time = duration
# 	is_running = true
# 	set_process(true)  # Enable processing when the timer starts

# # Process function called every frame
# func _process(delta):
# 	if is_running and current_time > 0:
# 		current_time -= delta
# 		print("Time remaining: " + str(current_time))
# 		if current_time <= 0:
# 			current_time = 0
# 			is_running = false
# 			set_process(false)  # Stop processing once the timer reaches zero
# 			handle_timeout()  # Handle timeout directly in TimerManager

# # Get the current time remaining on the timer
# func get_time():
# 	return current_time

# # Handle timeout behavior
# func handle_timeout():
# 	print("Game Over! Time's up!")
# 	emit_signal("timeout_signal")  # Emit the timeout signal
