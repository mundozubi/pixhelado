extends Node

@export var canvasx:int = 38
@export var canvasy:int = 38

var spawned_pixels_x:int = 0
var spawned_pixels_y:int = 0

var actual_pos_x:int = 0
var actual_pos_y:int = 0

var max_pos_x:int
var max_pos_y:int

var total_pixels:int
var generated_pixels:int

var xmove_per_pixel:int = 16
var ymove_per_pixel:int = 16

var pixel_type:int = 1
var reference_type:int = 0

var pixel = preload("res://pixel/nonresponsive_pixel.tscn")

func _ready() -> void:
	spawn_pixels()
	
	

func spawn_pixels(): # SPAWNEAR PIXELES
	var pixel_instance = pixel.instantiate()
	total_pixels = canvasx * canvasy
	max_pos_x = canvasx*xmove_per_pixel-xmove_per_pixel
	max_pos_y = canvasy*ymove_per_pixel-xmove_per_pixel
	spawn_pixel__()

func spawn_pixel__():
	while generated_pixels < total_pixels:
		var pixel_instance = pixel.instantiate()
		pixel_instance.position.x = actual_pos_x
		pixel_instance.position.y = actual_pos_y
		
		pixel_instance.type = pixel_type
		
		#$"../../Canvas/NRPixelContainer".add_child(pixel_instance)
		
		if actual_pos_x >= max_pos_x:
			actual_pos_y += ymove_per_pixel
			actual_pos_x = 0
			
			if reference_type == 0:
				pixel_type = 1
			elif reference_type == 1:
				pixel_type = 0
				
			reference_type = pixel_type
			
		elif actual_pos_x < max_pos_x:
			actual_pos_x += xmove_per_pixel
		
		pixel_type += 1
		if pixel_type >= 2:
			pixel_type = 0
		
		generated_pixels += 1
	
	

func spawn_pixel_y_position():
	var pixel_instance = pixel.instantiate()
