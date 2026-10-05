extends Node2D



var color

func _process(delta: float) -> void :
	var sprite = $gradient
	var texture = sprite.texture
	if texture == null:
		return

	var image = texture.get_image()
	if image == null:
		return

	var mouse_pos = get_viewport().get_mouse_position()
	var local_pos = sprite.to_local(mouse_pos)

	var tex_size = texture.get_size()
	var scale = sprite.scale


	if sprite.centered:
		local_pos += tex_size * scale / 2

	var pixel_x = int(local_pos.x / scale.x)
	var pixel_y = int(local_pos.y / scale.y)

	if pixel_x >= 0 and pixel_y >= 0 and pixel_x < tex_size.x and pixel_y < tex_size.y:
		color = image.get_pixel(pixel_x, pixel_y)



func _on_colourgradient_button_pressed() -> void :
	MouseSupervisor.selected_color = color
