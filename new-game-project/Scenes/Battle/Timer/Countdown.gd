# Game.gd
# An example script for your main game scene to show how to use the TimerBar.

extends Node2D

# --- Node References ---
# Assign your TimerBar node to this in the Inspector.
var timer_bar 

# --- Godot Functions ---
func _ready():
	timer_bar = $ProgressBar
	"""
	Connects to the TimerBar's signals.
	"""
	if timer_bar:
		timer_bar.connect("time_up", _on_TimerBar_time_up)
		timer_bar.connect("interval_reached", _on_TimerBar_interval_reached)

func _start_timer(startTime = 0):
	if startTime > 0:
		timer_bar.set_max_time(startTime)
	timer_bar.start_timer()
	
func adjust_time(adjustment):
	timer_bar.add_time(adjustment)

# --- Signal Handlers ---
func _on_TimerBar_time_up():
	"""
	This function is called when the timer runs out.
	"""
	print("Time is up! Game Over.")
	# Add your game over logic here, for example:
	get_tree().change_scene_to_file("res://Scenes/Temp/TempLoseScreen.tscn")


func _on_TimerBar_interval_reached(event_name: String):
	"""
	This function is called when a configured time interval is reached.
	"""
	print("Interval reached! Event: ", event_name)

	# Use a match statement to handle different events
	match event_name:
		"add_cards_high":
			_add_cards_to_deck(5)
		"add_cards_low":
			_add_cards_to_deck(3)
		"increase_mana_rate":
			_increase_mana_production(2.0)
		_:
			print("Warning: Unhandled event name '", event_name, "'")


# --- Example Event Functions ---
func _add_cards_to_deck(amount: int):
	"""
	A placeholder function for adding cards to the player's deck.
	"""
	print("Adding ", amount, " cards to the player's deck.")
	# Implement your actual card-adding logic here.

func _increase_mana_production(multiplier: float):
	"""
	A placeholder function for increasing mana production.
	"""
	print("Mana production is now multiplied by ", multiplier, ".")
	# Implement your resource modification logic here.
