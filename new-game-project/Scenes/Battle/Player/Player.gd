extends PlayerEntity

##############
# Player limit values
##############

var hand
var deck
var discard
var healthArea

var maxPlanningPerTurn = 1
var currentTimesPlannedOnPlanPhase = 0

var maxPlanningPoints = 0
var planningPoints = 0
var canAttack = true
var timesAbleToAttack = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	name = "player"
	hand = $Hand
	deck = $Deck
	discard = $DiscardPile
	healthArea = $HealthArea
	attackPower = 0


func damage(damageAmount):
	for i in range(0, damageAmount):
		healthArea.damage(hand)
			
	
func healthRemoval(removalAmount):
	for i in range(0, removalAmount):
		healthArea.removal(hand)
	
func heal(healAmount):
	health += healAmount

	
func ppup(rested = false):
	maxPlanningPoints = maxPlanningPoints + 1
	if(!rested):
		planningPoints = planningPoints + 1
	

	
func mainTurnPhase(target):
	if(target == name):
		print_debug("Main Phase")
		
func can_attack():
	return (canAttack and timesAbleToAttack > 0)
	
func getAttackPower():
	return $Weapon.get_attack_power() + attackPower
	
func used_attack():
	timesAbleToAttack = timesAbleToAttack - 1
		
func planTurnPhase(target):
	if(target == name):
		print_debug("Plan Phase")

func startTurnPhase(target):
	if(target == name):
		turn_reset()
		print_debug("START TURN PLAYER")
		timesAbleToAttack = 1
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

func get_pp():
	return planningPoints
	
func use_plan_points(cost):
	planningPoints = planningPoints - cost
	
func heal_plan_points(cost):
	planningPoints = planningPoints + cost
	
func turn_reset():
	planningPoints = maxPlanningPoints
	block = 0
	attackPower = 0
	
