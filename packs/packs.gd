extends Node2D

var data_set = [
	{ 
		"name": 'nature',
		"cards": ['Grass', 'Grass', 'Tree', 'Tree']
	},
	{ 
		"name": 'water',
		"cards": ['Water', 'Water', 'Riverside', 'Water']
	},
	{
		"name": 'housing',
		"cards": ['House', 'House']
	}
]

@onready var pack_scene = preload("res://packs/pack.tscn")
@onready var main_scene = preload("res://scenes/game.tscn")

@onready var nature_deck = load("res://packs/nature.tres")
@onready var water_deck = load("res://packs/water.tres")

@onready var grass_icon = preload("res://assets/tiles/grass.png")

var resource_map: Dictionary = {}

func map_icon_name(icon: Globals.VisualIconType):
	match icon:
		'Globals.VisualIconType.GRASS':
			return grass_icon
		_:
			return null

func initialize_pack(data, i) -> void:
	var pack_instance = pack_scene.instantiate()
	var deck_data = map_data_from_resource(data.name)
	pack_instance.get_node("PanelContainer/ColorRect2/MarginContainer/Background").color = deck_data['background']
	pack_instance.get_node("PanelContainer/ColorRect2/MarginContainer/Background/VBoxContainer/MarginContainer/Label2").text = deck_data['name']
	pack_instance.get_node("PanelContainer/ColorRect2/MarginContainer/Background/VBoxContainer/MarginContainer2/Label").text = deck_data['purchaseCost']
	pack_instance.get_node("PanelContainer/ColorRect2/MarginContainer/Background/VBoxContainer/MarginContainer3/Sprite2D").set_texture(grass_icon)
	pack_instance.position.x = pack_instance.position.x + i * 200
	
	add_child(pack_instance)

func load_packs() -> void:
	for i in data_set.size():
		initialize_pack(data_set[i], i)
		
func get_deck_resource(name: String) -> Resource:
	var deck_resource: Resource = resource_map[name]
	return deck_resource
	
func map_data_from_resource(name: String):
	var deck_data: Dictionary
	var deck_resource: Resource = get_deck_resource(name)
	deck_data = {
		"name": Globals.get_card_pack_type_name(deck_resource.name),
		"background": deck_resource.backgroundColor,
		"icon": Globals.get_icon_type_name(deck_resource.icon),
		"purchaseCost": deck_resource.purchaseCost
	}
	return deck_data

func _ready() -> void:
	resource_map = {
		"nature": nature_deck,
		"water": water_deck,
	}
	load_packs()
