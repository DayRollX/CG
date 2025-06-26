class_name PlayerEntity

extends Node

var health = 10

signal endPhaseSignal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../Game/GameStateLoop".connect("startPhase", startTurnPhase)
	$"../Game/GameStateLoop".connect("drawPhase", drawTurnPhase)
	$"../Game/GameStateLoop".connect("planPhase", planTurnPhase)
	$"../Game/GameStateLoop".connect("preMainPhase", preMainTurnPhase)
	$"../Game/GameStateLoop".connect("mainPhase", mainTurnPhase)
	$"../Game/GameStateLoop".connect("interactPhase", interactPhase)
	$"../Game/GameStateLoop".connect("interactResultPhase", interactResultPhase)
	$"../Game/GameStateLoop".connect("postMainPhase", postMainTurnPhase)
	$"../Game/GameStateLoop".connect("endTurnPhase", endTurnPhase)

	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func startTurnPhase(target):
	if(target == name):
		print_debug("Starting Turn - setup")
		endPhaseSignal.emit("")
	
func drawTurnPhase(target):
	if(target == name):
		print_debug("Draw Phase")
		endPhaseSignal.emit("")
	
func planTurnPhase(target):
	if(target == name):
		print_debug("Plan Phase")
		endPhaseSignal.emit("")

func preMainTurnPhase(target):
	if(target == name):
		print_debug("Pre-Main Phase")
		endPhaseSignal.emit("")

func mainTurnPhase(target):
	if(target == name):
		print_debug("Main Phase")
		endPhaseSignal.emit("")
		
func interactPhase(target):
	if(target == name):
		print_debug("Interact Phase")
		endPhaseSignal.emit("")
		
func interactResultPhase(target):
	if(target == name):
		print_debug("Interact Result Phase")
		endPhaseSignal.emit("")
	
func postMainTurnPhase(target):
	if(target == name):
		print_debug("Post Main Phase")
		endPhaseSignal.emit("")

func endTurnPhase(target):
	if(target == name):
		print_debug("End Phase")
		endPhaseSignal.emit("")
