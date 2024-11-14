extends Node2D

@onready var terrain_layer = get_parent().get_node('Terrain')

func _ready() -> void:
	pass
	

func handle_interaction(clicked_cell):
	var clicked_terrain_tile_id = terrain_layer.get_cell_source_id(clicked_cell)
	

func remove_tile(tile_coord: Vector2i) -> void:
	terrain_layer.set_cell(tile_coord, -1)
