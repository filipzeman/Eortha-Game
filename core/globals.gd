extends Node

enum VisualIconType { GRASS, TREE, WATER, FARM  }

enum CardPackType { NATURE, WATER, HOUSING, PRODUCTION }

enum BlockLayerType { TERRAIN, FOLIAGE }

enum CardType { GRASS, TREE, WATER, FARM, FISHING_HUT, HOUSE  }

func get_card_pack_type_name(index) -> String:
	return CardPackType.keys()[index]

func get_card_type_name(index) -> String:
	return CardType.keys()[index]

func get_icon_type_name(index) -> String:
	return VisualIconType.keys()[index]

func get_block_layer_type_name(index) -> String:
	return BlockLayerType.keys()[index]
