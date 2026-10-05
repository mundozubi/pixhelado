extends Node

@export var layers: int = 0
@export var canvasx: int = 32
@export var canvasy: int = 32

var generated_layers: int = 0

@onready var local_cmanager = $".."

@onready var canvas_image_l01 = $"../../../Canvas/RPixelContainer/rp_layer_01/canvas"
@onready var canvas_image_l02 = $"../../../Canvas/RPixelContainer/rp_layer_02/canvas"
@onready var canvas_image_l03 = $"../../../Canvas/RPixelContainer/rp_layer_03/canvas"
@onready var canvas_image_l04 = $"../../../Canvas/RPixelContainer/rp_layer_04/canvas"

@onready var canvas_prev_l01 = $"../../../interface/layer_previews/prev_00/layer00_prev"
@onready var canvas_prev_l02 = $"../../../interface/layer_previews/prev_01/layer01_prev"
@onready var canvas_prev_l03 = $"../../../interface/layer_previews/prev_02/layer02_prev"
@onready var canvas_prev_l04 = $"../../../interface/layer_previews/prev_03/layer03_prev"

var img_l01 = Image.create(canvasx, canvasy, false, Image.FORMAT_RGBA8)
var tex_l01 = ImageTexture.create_from_image(img_l01)

var img_l02 = Image.create(canvasx, canvasy, false, Image.FORMAT_RGBA8)
var tex_l02 = ImageTexture.create_from_image(img_l02)

var img_l03 = Image.create(canvasx, canvasy, false, Image.FORMAT_RGBA8)
var tex_l03 = ImageTexture.create_from_image(img_l03)

var img_l04 = Image.create(canvasx, canvasy, false, Image.FORMAT_RGBA8)
var tex_l04 = ImageTexture.create_from_image(img_l04)


func _ready() -> void :
	CanvasManager.data["canvas"]["layers_cant"] = 0

	CanvasManager.data["canvas"]["canvasx"] = ""
	CanvasManager.data["canvas"]["canvasy"] = ""
	CanvasManager.data["canvas"]["canvasx"] = canvasx
	CanvasManager.data["canvas"]["canvasy"] = canvasy

	canvas_prev_l01.texture = tex_l01
	canvas_prev_l02.texture = tex_l02
	canvas_prev_l03.texture = tex_l03
	canvas_prev_l04.texture = tex_l04

	canvas_image_l01.texture = tex_l01
	canvas_image_l02.texture = tex_l02
	canvas_image_l03.texture = tex_l03
	canvas_image_l04.texture = tex_l04

	generate_canvas()

func generate_canvas():
	img_l01.fill(Color(1, 1, 1, 0))
	tex_l01.update(img_l01)

	local_cmanager.add_new_canvas(img_l01, tex_l01, 1, canvas_image_l01, 19)


	img_l02.fill(Color(1, 1, 1, 0))
	tex_l02.update(img_l02)

	local_cmanager.add_new_canvas(img_l02, tex_l02, 2, canvas_image_l02, 19)


	img_l03.fill(Color(1, 1, 1, 0))
	tex_l03.update(img_l03)

	local_cmanager.add_new_canvas(img_l03, tex_l03, 3, canvas_image_l03, 19)


	img_l04.fill(Color(1, 1, 1, 0))
	tex_l04.update(img_l04)

	local_cmanager.add_new_canvas(img_l04, tex_l04, 4, canvas_image_l04, 19)

func rebuild_canvas_from_loaded_data():
	var canvasx = CanvasManager.data["canvas"]["canvasx"]
	var canvasy = CanvasManager.data["canvas"]["canvasy"]
	var layers = CanvasManager.data["canvas"]["layers_cant"]

	local_cmanager.local_data["canvas"] = {}

	for layer in range(1, layers + 1):
		var layer_case = "layer_" + str(layer)


		var img = Image.create(canvasx, canvasy, false, Image.FORMAT_RGBA8)
		img.fill(Color(0, 0, 0, 0))


		var tex = ImageTexture.create_from_image(img)

		var sprite
		var prev
		match layer:
			1:
				sprite = canvas_image_l01
				prev = canvas_prev_l01
			2:
				sprite = canvas_image_l02
				prev = canvas_prev_l02
			3:
				sprite = canvas_image_l03
				prev = canvas_prev_l03
			4:
				sprite = canvas_image_l04
				prev = canvas_prev_l04

		sprite.texture = tex
		prev.texture = tex


		local_cmanager.local_data["canvas"][layer_case] = {
			"image": img, 
			"texture": tex, 
			"sprite": sprite, 
			"visible": true
		}

func paint_pixel(x, y, color):
	img_l01.set_pixel(x, y, color)
	tex_l01.update(img_l01)
