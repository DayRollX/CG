extends Node

var cards:Array[Card] = []

func view_life():
	print("Card View")
	var i = 1
	for card in cards:
		print(i ,card.name)
		i += 1

func add_to_top(card:Card):
	cards.push_front(card)
	pass
	
func add_to_bottom(card:Card):
	cards.push_back(card)

func damage(cardLocationAfterDamage):
	if(cards.size() > 0):
		var card = cards.pop_front()
		cardLocationAfterDamage.add_card(card)
	else:
		print("Dead")
	
func get_health_amount():
	return cards.size()
