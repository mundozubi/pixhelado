extends Node2D


func _process(delta: float) -> void:
	var hex = $input.text
	
	if MouseSupervisor.selected_type_of_color == 2:
		$hexcolor/AnimationPlayer.play("pressed")
	else:
		$hexcolor/AnimationPlayer.play("inactive")
	
	
	if hex == "":
		return
	if hex.length() <= 2:
		return
	if hex.contains("."):
		return
	
	if not hex.begins_with("#"):
		hex = "#" + hex
	
	var color = Color(hex)
	MouseSupervisor.hex_color = color
	$hexcolor/inside.modulate = color
	


func _on_hexcolor_button_pressed() -> void:
	if MouseSupervisor.selected_type_of_color != 2:
		MouseSupervisor.selected_type_of_color = 2
	else:
		MouseSupervisor.selected_type_of_color = 0
	update_button_icon()

func update_button_icon():
	pass
