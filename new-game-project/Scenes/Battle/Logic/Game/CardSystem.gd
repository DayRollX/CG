extends Node

var timer
var player
var gamestate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = $"../../Player"
	timer = $"../Countdown"
	gamestate = $"../GameStateLoop"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func useSetup(card:Card, user, targets):
	for effect in card.setups:
		effect.execute(user, card, [targets])

func useCard(card, user ,targets):
	var lastEffectSucceeded = true
	if gamestate.currentPhase == GameEnums.PHASE.MAIN:
		for effect in card.cardData.effects:
			if effect.requires_last_effect_condition:
				# Prompt player for targets
				if(lastEffectSucceeded):
					lastEffectSucceeded = effect.execute(player, card, [timer])
				
			else:
				lastEffectSucceeded = effect.execute(player, card, [timer]) # TODO: Hard-coded right now
		afterCardUse(card.cardData, player)

	return true

func useDiscardFromDeckEffect(user, card:Card ,targets):
	var lastEffectSucceeded = true
	for effect in card.deckDiscardEffects:
			if effect.requires_last_effect_condition:
				# Prompt player for targets
				if(lastEffectSucceeded):
					lastEffectSucceeded = effect.execute(player, card, [timer])
				
			else:
				lastEffectSucceeded = effect.execute(player, card, [timer]) # TODO: Hard-coded right now


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
	

func useAbility():
	pass
	

func endOfTurnChecks(nameOfPlayerBeingChecked):
	var playerChecked
	var opposingPlayer
	
	if nameOfPlayerBeingChecked == player.name:
		playerChecked = player

		opposingPlayer = player
	
	var hand = playerChecked.get_node("Hand").get_cards()
	
	for card in hand:
		var cardData = card.cardData
		
		var effects = cardData.endOfTurnEffects
		
		for effect in effects:
			effect.execute(playerChecked, [card])
		
		print(hand)


func _on_ability_ability_used():
	player.get_node("Deck").draw()
	pass # Replace with function body.
