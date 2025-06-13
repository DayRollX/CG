class_name DebugPrintUtilities

extends Node

var printPhases = false

func debugPrintPhases(message):
	if(printPhases):
		print_debug(message)
	pass
