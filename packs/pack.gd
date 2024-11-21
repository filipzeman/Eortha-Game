extends Node2D

var default_position = self.position.y
var elevated_position = default_position - 50

@export var deck_name: String
@export var cards_data: Array

func _on_background_mouse_entered() -> void:
	self.position.y = elevated_position


func _on_background_mouse_exited() -> void:
	self.position.y = default_position


func _on_background_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		DeckState.active_pack = deck_name
		print('DeckState - Active pack' , DeckState.active_pack)
		initialize_cards()
		
		
		
func initialize_cards():
	print('Cards initialized')
	
