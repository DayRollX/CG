extends Node2D

signal endButtonSignal

# Called when the node enters the scene tree for the first time.
func _ready():
	$ClickableArea.connect("clicked", clicked)
	pass # Replace with function body.

func clicked():
	print_debug("End Button Pressed")
	endButtonSignal.emit("endButton")
	pass
