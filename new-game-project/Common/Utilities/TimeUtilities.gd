class_name TimeUtilities

extends Node

func wait_seconds(seconds: float) -> void:
	var timer = Timer.new()
	timer.wait_time = seconds
	timer.one_shot = true
	add_child(timer)  # Add the timer to the current node
	timer.start()
	await timer.timeout
	timer.queue_free()  # Clean up the timer after it's done
