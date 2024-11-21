extends Node

var deck_state: Array[CardResource] = []

var grass_card = load("res://cards/grass.tres")
var tree_card = load("res://cards/tree.tres")

var active_pack: String
var active_card: String

func add_card_to_deck(card_resource: CardResource, position: Vector2i):
	var card_entry = {
		"card": card_resource,
		"position": position 
	}
	deck_state.append(card_entry)
