extends Node

var players = {}

var currentPlayer
var currentPhase

signal startPhase
signal drawPhase
signal planPhase
signal preMainPhase
signal mainPhase
signal interactPhase
signal interactResultPhase
signal postMainPhase
signal endTurnPhase

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_debug("READY on Loop")
	
	$"../../Player".connect("endPhaseSignal", phaseDeterminer)
	$"../../UI/EndTurnButton".connect("endButtonSignal",phaseDeterminer)
	
	players.get_or_add("player", $"../../Player")
	
	$"../GameInitiator".connect("turnSignal", startPhaseFunc)
	pass # Replace with function body.

func phaseDeterminer(override):
	await wait_seconds(1)
	if override == "":
		match currentPhase:
			GameEnums.PHASE.START:
				mainPhaseFunc()
				
			GameEnums.PHASE.DRAW:
				planPhaseFunc()
				
			GameEnums.PHASE.PRE_MAIN:
				mainPhaseFunc()
				
			GameEnums.PHASE.MAIN:
				postMainPhaseFunc()
				
			GameEnums.PHASE.INTERACT:
				interactResultPhaseFunc()
				
			GameEnums.PHASE.INTERACT_RESULT:
				mainPhaseFunc()
				
			GameEnums.PHASE.POST_MAIN:
				endTurnPhaseFunc()
				
			GameEnums.PHASE.END_TURN:
				if(currentPlayer == "player"):
					startPhaseFunc("enemy")
				else:
					startPhaseFunc("player")
				
	else:
		print_debug("OVERRIDING Phase")
		if (override == "endButton" and currentPlayer == "player") and currentPhase == GameEnums.PHASE.MAIN:
			postMainPhaseFunc()
		if (override == "endButton" and currentPlayer == "player") and currentPhase == GameEnums.PHASE.PLAN:
			preMainPhaseFunc()
		if (override == "endButton" and currentPlayer == "player") and currentPhase == GameEnums.PHASE.PLAN:
			preMainPhaseFunc()
		if (override == "planUsed" and currentPlayer == "player") and currentPhase == GameEnums.PHASE.PLAN:
			preMainPhaseFunc()
		if (override == "endButton" and currentPlayer == "enemy") and currentPhase == GameEnums.PHASE.INTERACT:
			interactResultPhaseFunc()
		if (override == "interact" and currentPlayer == "enemy") and currentPhase == GameEnums.PHASE.MAIN:
			interactPhaseFunc()
		if (override == "end enemy main" and currentPlayer == "enemy"):
			postMainPhaseFunc()
		else:
			print_debug("override with no valid argument")
			
	pass

func startPhaseFunc(player):
	currentPlayer = player
	currentPhase = GameEnums.PHASE.START
	startPhase.emit(currentPlayer)
	
	pass
	
func drawPhaseFunc():
	currentPhase = GameEnums.PHASE.DRAW
	drawPhase.emit(currentPlayer)
	pass
	
func planPhaseFunc():
	currentPhase = GameEnums.PHASE.PLAN
	planPhase.emit(currentPlayer)
	pass
	
func preMainPhaseFunc():
	currentPhase = GameEnums.PHASE.PRE_MAIN
	preMainPhase.emit(currentPlayer)
	pass
	
func mainPhaseFunc():
	currentPhase = GameEnums.PHASE.MAIN
	mainPhase.emit(currentPlayer)
	if(Gamestate.get_level() == 0):
		$"../Countdown".start_timer(180)
	if(Gamestate.get_level() == 1):
		$"../Countdown".start_timer(150)
	if(Gamestate.get_level() == 2):
		$"../Countdown".start_timer(120)
	if(Gamestate.get_level() == 3):
		$"../Countdown".start_timer(90)
	if(Gamestate.get_level() == 4):
		$"../Countdown".start_timer(60)
	if(Gamestate.get_level() == 5):
		$"../Countdown".start_timer(30)
	pass
	
func interactPhaseFunc():
	currentPhase = GameEnums.PHASE.INTERACT
	interactPhase.emit(currentPlayer)
	
	
func interactResultPhaseFunc():
	currentPhase = GameEnums.PHASE.INTERACT_RESULT
	interactResultPhase.emit(currentPlayer)
	
func postMainPhaseFunc():
	currentPhase = GameEnums.PHASE.POST_MAIN
	postMainPhase.emit(currentPlayer)
	pass
	
func endTurnPhaseFunc():
	currentPhase = GameEnums.PHASE.END_TURN
	endTurnPhase.emit(currentPlayer)
	pass
	

func wait_seconds(seconds: float) -> void:
	var timer = Timer.new()
	timer.wait_time = seconds
	timer.one_shot = true
	add_child(timer)  # Add the timer to the current node
	timer.start()
	await timer.timeout
	timer.queue_free()  # Clean up the timer after it's done


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
