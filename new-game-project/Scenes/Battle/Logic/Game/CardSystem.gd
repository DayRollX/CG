extends Node

var enemy
var player
var gamestate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy = $"../../Enemy"
	player = $"../../Player"
	gamestate = $"../GameStateLoop"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func useCard(card:Card, user ,targets):
	if isCardUsable(card):
		if gamestate.currentPhase == GameEnums.PHASE.MAIN:
			player.use_plan_points(card.cost)
			for effect in card.effects:
				if effect.requires_target:
					# Prompt player for targets
					pass
				else:
					effect.execute(player, [enemy]) # TODO: Hard-coded right now
			afterCardUse(card, player)
		elif gamestate.currentPhase == GameEnums.PHASE.PLAN:
			increasePlan(card)
			gamestate.phaseDeterminer("planUsed")
		return true
	else:
		return false

func isCardUsable(card:Card):
	var usable = true
	usable = usable and (
		(gamestate.currentPhase == GameEnums.PHASE.MAIN) or 
		(gamestate.currentPhase == GameEnums.PHASE.PLAN)
		)
	usable = usable and gamestate.currentPlayer == 'player'
	
	if((gamestate.currentPhase == GameEnums.PHASE.MAIN)):
		print_debug(((player.get_pp() - card.get_cost())))
		usable = usable and (card.get_cost() <= player.get_pp()) and ((player.get_pp() - card.get_cost()) >= 0)
	
	return usable

func afterCardUse(card:Card, user:Node):
	var discardPile = user.get_node("DiscardPile")
	discardPile.add_to_pile(card)
	

func damagePlayer():
	player.damage(1)

func increasePlan(card):
	player.ppup()
