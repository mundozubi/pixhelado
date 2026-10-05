extends Node

var left_input: bool = false
var right_input: bool = false

var was_li: bool = false
var was_ri: bool = false

var selected_color = Color("#000")
var selected_type_of_color: int

var selected_tool: int = 0

var hsv_color = Color("#000")
var hex_color = Color("#fff")
var dropper_selected_color = Color("#fff")
var default_color = Color(1, 1, 1, 0)

var mouse_inside_canvas: bool = false
var canvas_sprite

var canvasx
var canvasy

var zoom: float = 1
var dragging = false
var canvas_moved_position = Vector2(0, 0)
var last_mouse_pos = Vector2.ZERO

var windows_page = null
var about_page = null
var check_updates_page = null

func _process(delta: float) -> void :
	left_input = Input.is_action_pressed("left_click")
	right_input = Input.is_action_pressed("right_click")

	if selected_type_of_color == 1:
		selected_color = hsv_color
	elif selected_type_of_color == 2:
		selected_color = hex_color
	elif selected_type_of_color == 3:
		selected_color = dropper_selected_color

	if Input.is_action_just_released("left_click") and mouse_inside_canvas:
		CanvasManager.data["canvas"]["undo_numb"] += 1
	if Input.is_action_just_released("right_click") and mouse_inside_canvas:
		CanvasManager.data["canvas"]["undo_numb"] += 1
	if Input.is_action_just_pressed("mouse_wheel_up") and mouse_inside_canvas:
		zoom += 0.1
	if Input.is_action_just_pressed("mouse_wheel_down") and mouse_inside_canvas:
		zoom -= 0.1
	if zoom < 1: zoom = 1
	if zoom > 3: zoom = 3

	if canvas_sprite != null and canvasx != null and canvasy != null:
		var local_pos = canvas_sprite.get_local_mouse_position()
		var x = int(local_pos.x * 19 / canvas_sprite.scale.x)
		var y = int(local_pos.y * 19 / canvas_sprite.scale.y)

		if windows_page != null and about_page != null and check_updates_page != null:
			mouse_inside_canvas = x >= 0 and x < canvasx and y >= 0 and y < canvasy and not about_page.visible and not windows_page.visible and not check_updates_page.visible


	if CanvasManager.data["canvas"].has("canvasx") and CanvasManager.data["canvas"].has("canvasy") and canvasx == null and canvasy == null:
		canvasx = CanvasManager.data["canvas"]["canvasx"]
		canvasy = CanvasManager.data["canvas"]["canvasy"]


func _input(event):

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MIDDLE and event.pressed:
			dragging = true
			last_mouse_pos = event.position

		if event.button_index == MOUSE_BUTTON_MIDDLE and not event.pressed:
			dragging = false

	if event is InputEventMouseMotion and dragging:
		var delta = event.position - last_mouse_pos
		canvas_moved_position += delta
		last_mouse_pos = event.position
