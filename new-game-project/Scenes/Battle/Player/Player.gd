extends PlayerEntity

##############
# Player limit values
##############

var hand
var deck
var discard
var healthArea

var block = 0

var maxPlanningPerTurn = 1
var currentTimesPlannedOnPlanPhase = 0

var maxPlanningPoints = 0
var planningPoints = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	name = "player"
	hand = $Hand
	deck = $Deck
	discard = $DiscardPile
	healthArea = $HealthArea
	update_health()
	update_planning_plan()
	update_block()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func damage(damageAmount):
	if(damageAmount > 0):
		for i in range(0, damageAmount):
			healthArea.damage(hand)
			
	update_health()
	
func heal(healAmount):
	health += healAmount
	update_health()
	
func ppup(rested = false):
	maxPlanningPoints = maxPlanningPoints + 1
	if(!rested):
		planningPoints = planningPoints + 1
	update_planning_plan()
	
func update_health():
	$"HPLabel/HP".text = str(healthArea.get_health_amount())
	
func update_planning_plan():
	$"PlanningLabel/PP".text = str(planningPoints) + " / " + str(maxPlanningPoints)
	
func update_block():
	$BlockLabel/PP.text = str(block)
	
func mainTurnPhase(target):
	if(target == name):
		print_debug("Main Phase")
		
func planTurnPhase(target):
	if(target == name):
		print_debug("Plan Phase")

func startTurnPhase(target):
	if(target == name):
		turn_reset()
		print_debug("START TURN PLAYER")
		update_planning_plan()
		update_block()
		endPhaseSignal.emit("")
		
func drawTurnPhase(target):
	if(target == name):
		print_debug("I AM DRAWING Phase")
		$Deck.draw()
		endPhaseSignal.emit("")
		
func interactPhase(target):
	if(target != name):
		block = 0
		
func increaseBlock(amount):
	block = block + amount
	update_block()

func get_pp():
	return planningPoints
	
func use_plan_points(cost):
	planningPoints = planningPoints - cost
	update_planning_plan()
	
func heal_plan_points(cost):
	planningPoints = planningPoints + cost
	update_planning_plan()
	
func turn_reset():
	planningPoints = maxPlanningPoints
	block = 0
