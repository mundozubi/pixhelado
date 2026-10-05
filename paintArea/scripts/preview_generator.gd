extends Node


func _process(delta):
	var max_size = $"../../../../interface/layer_previews/prev_00".size
	var tex_size = $"../../../../interface/layer_previews/prev_00/layer00_prev".texture.get_size()

	var scale_factor = min(
		max_size.x / tex_size.x, 
		max_size.y / tex_size.y
	)

	$"../../../../interface/layer_previews/prev_00/layer00_prev".scale = Vector2(scale_factor, scale_factor)
	$"../../../../interface/layer_previews/prev_01/layer01_prev".scale = Vector2(scale_factor, scale_factor)
	$"../../../../interface/layer_previews/prev_02/layer02_prev".scale = Vector2(scale_factor, scale_factor)
	$"../../../../interface/layer_previews/prev_03/layer03_prev".scale = Vector2(scale_factor, scale_factor)
