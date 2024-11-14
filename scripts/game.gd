extends Node2D

@onready var deck_interaction_handler = get_node('Deck Interaction Handler')
@onready var terrain_layer = get_node('Terrain')
@onready var foliage_layer = get_node('Foliage')

func _ready() -> void:
	var control = get_node('Control/Packs')
	var bottom_left_position = Vector2(0, get_viewport_rect().size.y)
	print('bottom left position', bottom_left_position)
	control.position = Vector2(40 -get_viewport_rect().size.x /2,get_viewport_rect().size.y /3 - 50)

#player interaction with tilemap
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var mouse_position = get_global_mouse_position()
			var clicked_terrain_cell = terrain_layer.local_to_map(get_local_mouse_position())
			var clicked_terrain_tile_id = terrain_layer.get_cell_source_id(clicked_terrain_cell)
			if clicked_terrain_tile_id == -1:
				print('clicked outside of possible locations')
				return null
				
			if clicked_terrain_tile_id != -1:
				print('interacted with block')
				deck_interaction_handler.handle_interaction(clicked_terrain_cell)

func _process(_delta: float) -> void:
	pass

# ToDo:
# 1. Create deck
# 2. create cards
# 3. continue with loop list

	
	
# Loop:
# 1. place block in the middle of screen
# 2. display pack
# 3. on deck click display cards
# 4. on card click save current layer and current selected card, which type of card and check all available cells
# 5. display highlight on free cells
# 6. handle click on highlight cell
# 7. remove original highlight
# 8. place block
# 9. check the current card income and increase earn per/s and update total money
# 9. FINISH
