extends Node2D

signal endButtonSignal

# Called when the node enters the scene tree for the first time.
func _ready():
	$ClickableArea.connect("clicked", clicked)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func clicked():
	print_debug("End Button Pressed")
	endButtonSignal.emit("endButton")
	pass
