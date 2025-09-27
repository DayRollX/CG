extends ProgressBar

# --- Exports (Configurable in the Inspector) ---
# The time in seconds the timer will start from.
@export var start_time : float = 0.0

# --- Private Variables ---
var _current_time : float = 0.0
var _is_running : bool = false


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

	# Check if time has run out
	if _current_time <= 0:
		_current_time = 0
		value = 0
		_is_running = false


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
	_is_running = true


func add_time(seconds: float):
	"""Adds a specified amount of time to the timer."""
	_current_time += seconds
	# Ensure the time doesn't exceed the maximum start time
	if _current_time > start_time:
		_current_time = start_time
	value = _current_time


func set_max_time(time):
	start_time = time
	max_value = time
	_current_time = time
	
func change_max_time(time):
	max_value = time
	
