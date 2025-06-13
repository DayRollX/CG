extends RichTextLabel

var playerName = ""
var phase = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$"../../Game/GameStateLoop".connect("startPhase", onStart)
	
	$"../../Game/GameStateLoop".connect("drawPhase", onDraw)
	$"../../Game/GameStateLoop".connect("planPhase", onPlan)
	$"../../Game/GameStateLoop".connect("preMainPhase", onMain)
	$"../../Game/GameStateLoop".connect("mainPhase", onMain)
	$"../../Game/GameStateLoop".connect("postMainPhase", onMain)
	$"../../Game/GameStateLoop".connect("endTurnPhase", onEnd) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func onStart(phaseIncomingText):
	phase = "Start Phase"
	playerName = phaseIncomingText
	onChange()
	
func onDraw(phaseIncomingText):
	phase = "Draw"
	onChange()
	
func onPlan(phaseIncomingText):
	if(playerName == "enemy"):
		phase = "Main"
	else:
		phase = "Plan"
	onChange()
	
func onMain(phaseIncomingText):
	phase = "Main"
	onChange()
	
func onEnd(phaseIncomingText):
	phase = "End"
	onChange()
	
func onChange():
	text = playerName + " - " + phase
