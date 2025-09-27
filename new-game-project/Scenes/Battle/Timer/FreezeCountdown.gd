extends Node2D

var _progress_bar

func _ready():
	_progress_bar = $ProgressBar

func _on_countdown_time_stop_change(isFrozen, currentTime, freezeDuration):
	if(isFrozen):
		_progress_bar.set_max_time(freezeDuration)
		_progress_bar.reset_timer()
		_progress_bar.start_timer()
		
	visible = isFrozen
		
