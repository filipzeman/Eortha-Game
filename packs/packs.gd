extends Node

var initial_data_set = [
   {
	  "name":"Nature",
	  "startPrice":"Free",
	  "bgColor":"64877f",
	  "icon":Globals.VisualIconType.GRASS,
	  "cards":[
		 {
			"name":"Grass",
			"growth":0.05,
			"description":"The base of your world",
			"icon":"grass"
		 },
		 {
			"name":"Grass",
			"growth":0.05,
			"description":"The base of your world",
			"icon":"grass"
		 },
		 {
			"name":"Grass",
			"growth":0.05,
			"description":"The base of your world",
			"icon":"grass"
		 },
	  ]
   },{
	  "name":"Water",
	  "startPrice":'150 $',
	  "bgColor":"#1DA7E1",
	  "icon":"water",
	  "cards":[
		 {
			"name":"Water",
			"growth":0.1,
			"bonusBlock": "water",
			"bonusGrowth": 0.2,
			"bonusText": '/ adjacent water',
			"description":"Some animals like to dive in it",
			"icon":"water"
		 },
		 {
			"name":"Water",
			"growth":0.1,
			"bonusBlock": "water",
			"bonusGrowth": 0.2,
			"bonusText": '/ adjacent water',
			"description":"Some animals like to dive in it",
			"icon":"water"
		 },
		{
			"name":"Water",
			"growth":0.1,
			"bonusBlock": "water",
			"bonusGrowth": 0.2,
			"bonusText": '/ adjacent water',
			"description":"Some animals like to dive in it",
			"icon":"water"
		 },
	  ]
   }
]

@onready var pack_resource = preload("res://packs/Pack.tscn")
@onready var grass_icon = preload("res://assets/tiles/grass.png")

var window_position = DisplayServer.window_get_position()
var window_size = DisplayServer.window_get_size()

func map_icon_name(icon: Globals.VisualIconType):
	match icon:
		'Globals.VisualIconType.GRASS':
			return grass_icon
		_:
			return null

func initialize_pack(data, i) -> void:
	var pack_instance = pack_resource.instantiate()
	pack_instance.get_node("PanelContainer/ColorRect2/MarginContainer/Background").color = data.bgColor
	pack_instance.get_node("PanelContainer/ColorRect2/MarginContainer/Background/VBoxContainer/MarginContainer/Label2").text = data.name
	pack_instance.get_node("PanelContainer/ColorRect2/MarginContainer/Background/VBoxContainer/MarginContainer2/Label").text = data.startPrice
	pack_instance.get_node("PanelContainer/ColorRect2/MarginContainer/Background/VBoxContainer/MarginContainer3/Sprite2D").set_texture(grass_icon)
	pack_instance.position.x = pack_instance.position.x + i* 160
	#pack_instance.data = data.cards
	add_child(pack_instance)

func load_packs() -> void:
	for i in initial_data_set.size():
		initialize_pack(initial_data_set[i], i)

func _ready() -> void:
	load_packs()
