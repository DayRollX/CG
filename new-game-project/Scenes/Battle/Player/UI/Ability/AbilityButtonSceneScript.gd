extends Node

signal ability_used


func _on_button_pressed():
	if($ProgressBar.value >= 10):
		$ProgressBar.value = 0
		emit_signal("ability_used")
	pass # Replace with function body.

func charge_ability(amount):
	$ProgressBar.value += amount
	
func charge_ability_fully():
	$ProgressBar.value = $ProgressBar.max_value


func _on_progress_bar_game_delta_time(time):
	$ProgressBar.value += time
