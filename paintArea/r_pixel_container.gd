extends Node2D

var copy: bool = false

func update_all_colours():
	var pixels = get_children()
	for pixel in pixels:
		pixel.load_new_color()
