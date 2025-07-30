extends PlayerEntity

var currentCard

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	name = "enemy"
	update_health()
	update_attack()
	attackPower = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func damage(damageAmount):
	health -= damageAmount
	update_health()
	
func heal(healAmount):
	health += healAmount
	update_health()
	
func attack(amount):
	attackPower = attackPower + amount
	update_attack()
	
func update_health():
	$"HPLabel/HP".text = str(health)
	
func update_attack():
	$DamageLabel/Damage.text = str(attackPower)
	
func reset_attack():
	attackPower = 0
	$DamageLabel/Damage.text = str(attackPower)

func mainTurnPhase(target):
	print_debug("Main Phase")
	
	if(target == name):
		$Deck.draw()
		var cardsInHand = $Hand.get_cards()
		for cardInHand in cardsInHand:
			currentCard = cardInHand
			
		if currentCard.cardData.interactable:
			endPhaseSignal.emit("interact")
		else:
			cardSystem.useCard(currentCard.cardData, self, $"../Player")
			currentCard.remove_card()
			print_debug("Main Phase")
			endPhaseSignal.emit("")



func interactPhase(target):
	if(target == name):
		print_debug("Interact Phase Override enemy")
		cardSystem.useSetup(currentCard.cardData, self, $"../Player")
		update_health()
		update_attack()
		#endPhaseSignal.emit("")
		
func interactResultPhase(target):
	if(target == name):
		cardSystem.useCard(currentCard.cardData, self, $"../Player")
		currentCard.remove_card()
		print_debug("Interact Result Phase Override enemy")
		endPhaseSignal.emit("end enemy main")
		
		reset_attack()
