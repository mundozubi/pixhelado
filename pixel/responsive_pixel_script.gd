extends Area2D

@export var id: int


var ntop
var ndown
var nleft
var nright

var case = "pixel_" + str(id)

@export var color = Color(1, 1, 0, 0)
var default_color = Color(1, 1, 0, 0)

var color_before_up

func _ready() -> void :
	create_id()
	update_parameters()


func create_id():
	case = "pixel_" + str(id)

	CanvasManager.canvas_pixels_nodes[case] = self



func update_parameters():
	$ColourManagement.color = color
	$ColourManagement.id = id
	$ColourManagement.case = case
	$Sprite.modulate = color

	CanvasManager.canvas_pixels[case] = color



func load_new_color():
	var new_color = CanvasManager.canvas_pixels[case]
	color = new_color
	update_parameters()


func colour_neighboor_pixels(selected_color):
	await get_tree().process_frame

	var canvasx = CanvasManager.canvasx
	var canvasy = CanvasManager.canvasy

	var ntop_id = id - canvasx
	var ndown_id = id + canvasx
	var nright_id = id + 1
	var nleft_id = id - 1

	var ntop_case = "pixel_" + str(ntop_id)
	var ndown_case = "pixel_" + str(ndown_id)
	var nright_case = "pixel_" + str(nright_id)
	var nleft_case = "pixel_" + str(nleft_id)

	if CanvasManager.canvas_pixels_nodes.has(ntop_case):
		ntop = CanvasManager.canvas_pixels_nodes[ntop_case]
	if CanvasManager.canvas_pixels_nodes.has(ndown_case):
		ndown = CanvasManager.canvas_pixels_nodes[ndown_case]
	if CanvasManager.canvas_pixels_nodes.has(nright_case):
		nright = CanvasManager.canvas_pixels_nodes[nright_case]
	if CanvasManager.canvas_pixels_nodes.has(nleft_case):
		nleft = CanvasManager.canvas_pixels_nodes[nleft_case]

	var old_color = color

	color = selected_color
	$ColourManagement.color = color
	$ColourManagement.id = id
	$ColourManagement.case = case
	$Sprite.modulate = color
	CanvasManager.canvas_pixels[case] = color

	var ntop_color
	var ndown_color
	var nright_color
	var nleft_color

	if CanvasManager.canvas_pixels.has(ntop_case):
		ntop_color = CanvasManager.canvas_pixels[ntop_case]
	if CanvasManager.canvas_pixels.has(ndown_case):
		ndown_color = CanvasManager.canvas_pixels[ndown_case]
	if CanvasManager.canvas_pixels.has(nright_case):
		nright_color = CanvasManager.canvas_pixels[nright_case]
	if CanvasManager.canvas_pixels.has(nleft_case):
		nleft_color = CanvasManager.canvas_pixels[nleft_case]

	if ntop_color == old_color and ntop_color != selected_color:
		ntop.colour_neighboor_pixels(selected_color)
	if ndown_color == old_color and ndown_color != selected_color:
		ndown.colour_neighboor_pixels(selected_color)
	if nright_color == old_color and nright_color != selected_color:
		nright.colour_neighboor_pixels(selected_color)
	if nleft_color == old_color and nleft_color != selected_color:
		nleft.colour_neighboor_pixels(selected_color)


func change_color_to(new_color):
	color = new_color
	update_parameters()

func get_color():
	if color != default_color:
		MouseSupervisor.dropper_selected_color = color
		MouseSupervisor.selected_tool = 0
