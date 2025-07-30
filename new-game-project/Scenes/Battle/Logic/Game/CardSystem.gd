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

func useSetup(card:Card, user, targets):
	for effect in card.setups:
		effect.execute(user, [targets])

func useCard(card:Card, user ,targets):
	if user == null or user.name != "enemy":
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
				
			elif gamestate.currentPhase == GameEnums.PHASE.INTERACT:
				player.increaseBlock(card.block)
			return true
		else:
			return false
	else:
		for effect in card.effects:
			if effect.requires_target:
				# Prompt player for targets
				pass
			else:
				effect.execute(enemy, [player]) # TODO: Hard-coded right now
		afterCardUse(card, user)

func isCardUsable(card:Card):
	var usable = true
	usable = usable and (
		(gamestate.currentPhase == GameEnums.PHASE.MAIN) or 
		(gamestate.currentPhase == GameEnums.PHASE.PLAN) or
		(gamestate.currentPhase == GameEnums.PHASE.INTERACT)
		)
	
	
	if (gamestate.currentPlayer != 'player'):
		usable = usable and (gamestate.currentPhase == GameEnums.PHASE.INTERACT)
	else:
		usable = usable and (gamestate.currentPlayer == 'player')
		
	if((gamestate.currentPhase == GameEnums.PHASE.MAIN)):
		print_debug(((player.get_pp() - card.get_cost())))
		usable = usable and (card.get_cost() <= player.get_pp()) and ((player.get_pp() - card.get_cost()) >= 0)
	
	return usable

func afterCardUse(card:Card, user:Node):
	var discardPile = user.get_node("DiscardPile")
	discardPile.add_to_pile(card)
	
func useWeaponCard(card:WeaponCard, user:Node, targets):
	for effect in card.onAttackEffects:
		if effect.requires_target:
			# Prompt player for targets
			pass
		else:
			effect.execute(player, [enemy]) # TODO: Hard-coded right now

	pass

func increasePlan(card):
	player.ppup()

func endOfTurnChecks(nameOfPlayerBeingChecked):
	var playerChecked
	var opposingPlayer
	
	if nameOfPlayerBeingChecked == player.name:
		playerChecked = player
		opposingPlayer = enemy
	else:
		playerChecked = enemy
		opposingPlayer = player
	
	var hand = playerChecked.get_node("Hand").get_cards()
	
	for card in hand:
		var cardData = card.cardData
		
		var effects = cardData.endOfTurnEffects
		
		for effect in effects:
			effect.execute(playerChecked, [card])
		
		print(hand)
