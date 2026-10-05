extends Node2D


var img = Image.create(2, 2, false, Image.FORMAT_RGBA8)
var tex = ImageTexture.create_from_image(img)


func _ready() -> void :
	img.fill(Color(1, 1, 1, 1))
	paint_pixel(1, 1, Color(0, 0, 0, 1))

func _process(delta: float) -> void :
	$Sprite2D.texture = tex

func paint_pixel(x, y, color):
	img.set_pixel(x, y, color)
	tex.update(img)
