# TimerBar.gd
# This script should be attached to a TextureProgressBar node.

extends ProgressBar

# --- Signals ---
# Emitted when the timer reaches 0.
signal time_up

# Emitted when a configured time interval is reached.
# Passes the event name associated with the interval.
signal interval_reached(event_name)

signal delta_time


# --- Exports (Configurable in the Inspector) ---
# The time in seconds the timer will start from.
@export var start_time : float = 60.0

# An array to define events at specific time intervals.
# Each element is a dictionary with "time_left" and "event_name".
# Example: [{"time_left": 40, "event_name": "add_3_cards"}, {"time_left": 20, "event_name": "double_mana"}]
@export var event_intervals : Array = []


# --- Private Variables ---
var _current_time : float = 0.0
var _is_running : bool = false
var _processed_intervals : Array = []


# --- Godot Functions ---
func _ready():
	"""
	Called when the node enters the scene tree for the first time.
	Initializes the timer and the progress bar.
	"""
	max_value = start_time
	_current_time = start_time
	value = _current_time
	# You can start the timer automatically or call start() from another script.

func _process(delta):
	"""
	Called every frame. Updates the timer and checks for events.
	"""
	if not _is_running:
		return

	# Decrement the timer
	_current_time -= delta
	value = _current_time

	# Check for configured event intervals
	_check_for_intervals()
	_send_time(delta)

	# Check if time has run out
	if _current_time <= 0:
		_current_time = 0
		value = 0
		_is_running = false
		emit_signal("time_up")


# --- Public Functions ---
func start_timer():
	"""Starts or resumes the timer."""
	_is_running = true

func pause_timer():
	"""Pauses the timer."""
	_is_running = false

func reset_timer():
	"""Resets the timer to its starting time."""
	_current_time = start_time
	value = _current_time
	_processed_intervals.clear()
	_is_running = true


func add_time(seconds: float):
	"""Adds a specified amount of time to the timer."""
	_current_time += seconds
	# Ensure the time doesn't exceed the maximum start time
	if _current_time > start_time:
		_current_time = start_time
	value = _current_time


# --- Private Helper Functions ---
func _check_for_intervals():
	"""
	Iterates through the event intervals and triggers them if the time is right.
	"""
	for interval in event_intervals:
		var time_left = interval.get("time_left")
		var event_name = interval.get("event_name")

		# Check if the interval time has been reached and it hasn't been processed yet
		if _current_time <= time_left and not time_left in _processed_intervals:
			emit_signal("interval_reached", event_name)
			_processed_intervals.append(time_left)

func _send_time(delta):
	emit_signal("delta_time",delta)
	
func set_max_time(time):
	max_value = time
	value = time
	
func change_max_time(time):
	max_value = time
	
