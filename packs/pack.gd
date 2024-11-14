extends StaticBody2D

var default_position = self.position.y
var elevated_position = default_position - 20

func _on_background_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print('Clicked on pack')

func _on_background_mouse_entered() -> void:
	print('mouse entered')
	self.position.y = elevated_position


func _on_background_mouse_exited() -> void:
	print('mouse left')
	self.position.y = default_position
