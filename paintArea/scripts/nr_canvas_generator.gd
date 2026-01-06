extends Node

var canvasx:int
var canvasy:int

var generated_pixels:int = 0
var need_pixels

var paint_color
var color01 = Color("#eee")
var color02 = Color("#ddd")

var type:int = 1
var or_pixel_type:int = 1

var genx:int = 0
var geny:int = 0

var img = Image.create(canvasx, canvasy, false, Image.FORMAT_RGBA8)
var tex = ImageTexture.create_from_image(img)

func _ready() -> void:
	canvasx = $"../CanvasGenerator".canvasx
	canvasy = $"../CanvasGenerator".canvasy
	need_pixels = canvasx*canvasy
	
	img = Image.create(canvasx, canvasy, false, Image.FORMAT_RGBA8)
	tex = ImageTexture.create_from_image(img)
	$"../../../Canvas/NRPixelContainer/canvas".texture = tex
	
	generate_nr_pixels()
	
func generate_nr_pixels():
	while generated_pixels < need_pixels:
		if type == 1:
			paint_color = color01
			type += 1
		elif type >= 2:
			paint_color = color02
			type = 1
		
		paint_pixel(genx,geny,paint_color)
		
		if genx >= canvasx - 1:
			geny += 1
			genx = 0
			
			if or_pixel_type == 1:
				type = 2
				or_pixel_type = 2
			elif or_pixel_type == 2:
				type = 1
				or_pixel_type = 1
		else:
			genx += 1
		
		generated_pixels += 1


func paint_pixel(x, y, color):
	img.set_pixel(x, y, color)
	tex.update(img) 
