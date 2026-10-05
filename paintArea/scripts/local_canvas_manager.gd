extends Node

var local_data: Dictionary = {
	"canvas" = {}
}

var canvas_ori_scale = Vector2(1, 1)

func _ready() -> void :
	canvas_ori_scale = $"../../Canvas".scale

func _process(delta: float) -> void :


	if MouseSupervisor.left_input == true and MouseSupervisor.selected_tool == 0 and CanvasManager.enable_painting:


		var active_layer = "layer_" + str(CanvasManager.data["canvas"]["active_layer"])


		if CanvasManager.data["canvas"].has(active_layer):

			var canvas_sprite = local_data["canvas"][active_layer]["sprite"]
			var canvas_image = local_data["canvas"][active_layer]["image"]
			var texture = local_data["canvas"][active_layer]["texture"]
			var local_pos = canvas_sprite.get_local_mouse_position()
			var pixel_x = int(local_pos.x * 19 / canvas_sprite.scale.x)
			var pixel_y = int(local_pos.y * 19 / canvas_sprite.scale.y)

			var selected_color = MouseSupervisor.selected_color
			var layer = CanvasManager.data["canvas"]["active_layer"]

			paint_pixel(pixel_x, pixel_y, layer, selected_color, canvas_image, texture, true, true, true)

	elif MouseSupervisor.right_input == true and MouseSupervisor.selected_tool == 0 and CanvasManager.enable_painting:


		var active_layer = "layer_" + str(CanvasManager.data["canvas"]["active_layer"])


		if CanvasManager.data["canvas"].has(active_layer):

			var canvas_sprite = local_data["canvas"][active_layer]["sprite"]
			var canvas_image = local_data["canvas"][active_layer]["image"]
			var texture = local_data["canvas"][active_layer]["texture"]
			var local_pos = canvas_sprite.get_local_mouse_position()
			var pixel_x = int(local_pos.x * 19 / canvas_sprite.scale.x)
			var pixel_y = int(local_pos.y * 19 / canvas_sprite.scale.y)

			var selected_color = Color(1, 1, 1, 0)
			var layer = CanvasManager.data["canvas"]["active_layer"]
			paint_pixel(pixel_x, pixel_y, layer, selected_color, canvas_image, texture, true, true, true)



	if MouseSupervisor.left_input == true and MouseSupervisor.selected_tool == 1 and CanvasManager.enable_painting:


		var active_layer = "layer_" + str(CanvasManager.data["canvas"]["active_layer"])


		if CanvasManager.data["canvas"].has(active_layer):

			var canvas_sprite = local_data["canvas"][active_layer]["sprite"]
			var canvas_image = local_data["canvas"][active_layer]["image"]
			var texture = local_data["canvas"][active_layer]["texture"]
			var local_pos = canvas_sprite.get_local_mouse_position()
			var pixel_x = int(local_pos.x * 19 / canvas_sprite.scale.x)
			var pixel_y = int(local_pos.y * 19 / canvas_sprite.scale.y)

			var selected_color = Color(1, 1, 1, 0)
			var layer = CanvasManager.data["canvas"]["active_layer"]
			paint_pixel(pixel_x, pixel_y, layer, selected_color, canvas_image, texture, true, true, true)



	if MouseSupervisor.left_input == true and MouseSupervisor.selected_tool == 3 and CanvasManager.enable_painting:


		var active_layer = "layer_" + str(CanvasManager.data["canvas"]["active_layer"])


		if CanvasManager.data["canvas"].has(active_layer):

			var canvas_sprite = local_data["canvas"][active_layer]["sprite"]
			var canvas_image = local_data["canvas"][active_layer]["image"]
			var local_pos = canvas_sprite.get_local_mouse_position()
			var pixel_x = int(local_pos.x * 19 / canvas_sprite.scale.x)
			var pixel_y = int(local_pos.y * 19 / canvas_sprite.scale.y)

			var pixel_color = get_pixel_color(pixel_x, pixel_y, canvas_image)

			if pixel_color != Color(1, 1, 1, 0):
				MouseSupervisor.dropper_selected_color = pixel_color
				MouseSupervisor.selected_type_of_color = 3
				MouseSupervisor.selected_tool = 0
			else:
				return



	if MouseSupervisor.left_input == true and MouseSupervisor.selected_tool == 2 and CanvasManager.enable_painting:


		var active_layer = "layer_" + str(CanvasManager.data["canvas"]["active_layer"])


		if CanvasManager.data["canvas"].has(active_layer):

			var canvas_sprite = local_data["canvas"][active_layer]["sprite"]
			var canvas_image = local_data["canvas"][active_layer]["image"]
			var texture = local_data["canvas"][active_layer]["texture"]
			var local_pos = canvas_sprite.get_local_mouse_position()
			var pixel_x = int(local_pos.x * 19 / canvas_sprite.scale.x)
			var pixel_y = int(local_pos.y * 19 / canvas_sprite.scale.y)



			var layer = CanvasManager.data["canvas"]["active_layer"]
			var layer_case = "layer_" + str(layer)
			var pixel_case = "px_" + str(pixel_x) + "_" + str(pixel_y)
			var old_color
			if CanvasManager.data["canvas"][layer_case]["pixels"].has(pixel_case):
				old_color = CanvasManager.data["canvas"][layer_case]["pixels"][pixel_case]["color"]
			else:
				return
			var selected_color = MouseSupervisor.selected_color

			var canvasx = CanvasManager.data["canvas"]["canvasx"]
			var canvasy = CanvasManager.data["canvas"]["canvasy"]

			CanvasManager.data["canvas"][layer_case]["ff_numb"] += 1


			paint_neighbor_pixels(pixel_x, pixel_y, layer, canvas_image, texture, canvas_sprite, old_color, selected_color)

	elif MouseSupervisor.right_input == true and MouseSupervisor.selected_tool == 2 and CanvasManager.enable_painting:


		var active_layer = "layer_" + str(CanvasManager.data["canvas"]["active_layer"])


		if CanvasManager.data["canvas"].has(active_layer):

			var canvas_sprite = local_data["canvas"][active_layer]["sprite"]
			var canvas_image = local_data["canvas"][active_layer]["image"]
			var texture = local_data["canvas"][active_layer]["texture"]
			var local_pos = canvas_sprite.get_local_mouse_position()
			var pixel_x = int(local_pos.x * 19 / canvas_sprite.scale.x)
			var pixel_y = int(local_pos.y * 19 / canvas_sprite.scale.y)



			var layer = CanvasManager.data["canvas"]["active_layer"]
			var layer_case = "layer_" + str(layer)
			var pixel_case = "px_" + str(pixel_x) + "_" + str(pixel_y)
			var old_color
			if CanvasManager.data["canvas"][layer_case]["pixels"].has(pixel_case):
				old_color = CanvasManager.data["canvas"][layer_case]["pixels"][pixel_case]["color"]
			else:
				return
			var selected_color = MouseSupervisor.default_color

			var canvasx = CanvasManager.data["canvas"]["canvasx"]
			var canvasy = CanvasManager.data["canvas"]["canvasy"]

			CanvasManager.data["canvas"][layer_case]["ff_numb"] += 1


			paint_neighbor_pixels(pixel_x, pixel_y, layer, canvas_image, texture, canvas_sprite, old_color, selected_color)




	if Input.is_action_just_pressed("ctrl+z"):
		var layers = CanvasManager.data["canvas"]["layers_cant"]
		var canvasx = CanvasManager.data["canvas"]["canvasx"]
		var canvasy = CanvasManager.data["canvas"]["canvasy"]

		var x = 0
		var y = 0
		var ly = 1

		var undo_numb = CanvasManager.data["canvas"]["undo_numb"]

		while ly <= layers:
			var px_case = "px_" + str(x) + "_" + str(y)
			var ly_case = "layer_" + str(ly)

			var image = local_data["canvas"][ly_case]["image"]
			var texture = local_data["canvas"][ly_case]["texture"]

			if CanvasManager.data["canvas"][ly_case]["pixels"][px_case]["undo"] == undo_numb:
				var nw_color = CanvasManager.data["canvas"][ly_case]["pixels"][px_case]["old_color"]
				paint_pixel(x, y, ly, nw_color, image, texture, false, true, true)

			x += 1
			if x >= canvasx:
				x = 0
				y += 1
			if y >= canvasy:
				x = 0
				y = 0
				ly += 1


	var zoom = MouseSupervisor.zoom
	$"../../Canvas".scale = canvas_ori_scale * zoom

	$"../../antizoom".visible = zoom != 1


	var canvas: = $"../../Canvas"
	var canvas_tex: ImageTexture = $"../../Canvas/NRPixelContainer/canvas".texture
	var canvas_sprite = $"../../Canvas/NRPixelContainer/canvas"
	var canvas_size = canvas_tex.get_size() * canvas_sprite.scale * zoom

	canvas.position = MouseSupervisor.canvas_moved_position

	if zoom > 1:

		var max_x = 848
		var min_x = 288
		var max_y = 664
		var min_y = 88

		var left = canvas.position.x
		var right = canvas.position.x + canvas_size.x
		var top = canvas.position.y
		var bottom = canvas.position.y + canvas_size.y

		if left > min_x:
			canvas.position.x = min_x
		if right < max_x:
			canvas.position.x = max_x - canvas_size.x
		if top > min_y:
			canvas.position.y = min_y
		if bottom < max_y:
			canvas.position.y = max_y - canvas_size.y
	else:
		canvas.position = Vector2(288, 88)
	MouseSupervisor.canvas_moved_position = canvas.position

func add_new_canvas(image, texture, layer, sprite, scale):
	var layer_case_name = "layer_" + str(layer)
	var layer_numb = str(layer)

	print(layer_case_name)

	CanvasManager.data["canvas"][layer_case_name] = {}
	CanvasManager.data["canvas"]["active_layer"] = ""
	CanvasManager.data["canvas"]["layers_cant"] += 1

	CanvasManager.data["canvas"]["active_layer"] = layer

	local_data["canvas"][layer_case_name] = {}
	local_data["canvas"][layer_case_name]["image"] = ""
	local_data["canvas"][layer_case_name]["texture"] = ""
	local_data["canvas"][layer_case_name]["sprite"] = ""
	local_data["canvas"][layer_case_name]["visible"] = ""

	local_data["canvas"][layer_case_name]["image"] = image
	local_data["canvas"][layer_case_name]["texture"] = texture
	local_data["canvas"][layer_case_name]["sprite"] = sprite
	local_data["canvas"][layer_case_name]["visible"] = true

	var canvasx = CanvasManager.data["canvas"]["canvasx"]
	var canvasy = CanvasManager.data["canvas"]["canvasy"]

	var logged_pixels: int = 0
	var pixel_x: int = 0
	var pixel_y: int = 0
	var needed_pixels: int = canvasx * canvasy

	CanvasManager.data["canvas"][layer_case_name]["pixels"] = {}
	CanvasManager.data["canvas"][layer_case_name]["ff_numb"] = ""
	CanvasManager.data["canvas"][layer_case_name]["ff_numb"] = 1

	while logged_pixels < needed_pixels:
		var pixel_case: String = "px_" + str(pixel_x) + "_" + str(pixel_y)
		var pixel_color = get_pixel_color(pixel_x, pixel_y, image)

		CanvasManager.data["canvas"][layer_case_name]["pixels"][pixel_case] = {}
		CanvasManager.data["canvas"][layer_case_name]["pixels"][pixel_case]["color"] = ""
		CanvasManager.data["canvas"][layer_case_name]["pixels"][pixel_case]["color"] = pixel_color
		CanvasManager.data["canvas"][layer_case_name]["pixels"][pixel_case]["flood_fill"] = ""
		CanvasManager.data["canvas"][layer_case_name]["pixels"][pixel_case]["flood_fill"] = 0
		CanvasManager.data["canvas"][layer_case_name]["pixels"][pixel_case]["undo"] = ""
		CanvasManager.data["canvas"][layer_case_name]["pixels"][pixel_case]["undo"] = 0
		CanvasManager.data["canvas"][layer_case_name]["pixels"][pixel_case]["action"] = ""
		CanvasManager.data["canvas"][layer_case_name]["pixels"][pixel_case]["action"] = 0
		CanvasManager.data["canvas"][layer_case_name]["pixels"][pixel_case]["old_color"] = ""
		CanvasManager.data["canvas"][layer_case_name]["pixels"][pixel_case]["old_color"] = null

		pixel_x += 1
		if pixel_x >= canvasx:
			pixel_x = 0
			pixel_y += 1
		logged_pixels += 1
	print(CanvasManager.data["canvas"]["layers_cant"])

func paint_pixel(x, y, layer, color, image, texture, enable_brush_size, enable_undo_control, enable_color_control):
	var canvasx = CanvasManager.data["canvas"]["canvasx"]
	var canvasy = CanvasManager.data["canvas"]["canvasy"]

	var layer_case = "layer_" + str(layer)
	var pixel_case = "px_" + str(x) + "_" + str(y)

	if x >= 0 and x < canvasx and y >= 0 and y < canvasy and CanvasManager.data["canvas"][layer_case]["pixels"].has(pixel_case):
		if CanvasManager.data["canvas"][layer_case]["pixels"][pixel_case]["color"] != color and enable_color_control or not enable_color_control:
			image.set_pixel(x, y, color)
			texture.update(image)

			CanvasManager.data["canvas"][layer_case]["pixels"][pixel_case]["old_color"] = CanvasManager.data["canvas"][layer_case]["pixels"][pixel_case]["color"]
			CanvasManager.data["canvas"][layer_case]["pixels"][pixel_case]["color"] = color

			if CanvasManager.data["canvas"][layer_case]["pixels"][pixel_case]["undo"] != CanvasManager.data["canvas"]["undo_numb"]:
				CanvasManager.data["canvas"][layer_case]["pixels"][pixel_case]["undo"] = CanvasManager.data["canvas"]["undo_numb"] + 1

	var brush_size = ToolsSettings.tSettings["brush_size"]
	if brush_size > 1 and enable_brush_size:
		var back_cant = brush_size - 1
		var father_pixel = Vector2(x - back_cant, y - back_cant)
		var mother_pixel = Vector2(x + back_cant, y + back_cant)

		var px_x = father_pixel.x
		var px_y = father_pixel.y


		while px_x <= mother_pixel.x and px_y <= mother_pixel.y:
			var px_case = "px_" + str(px_x) + "_" + str(px_y)
			paint_pixel(px_x, px_y, layer, color, image, texture, false, true, true)
			px_x += 1
			if px_x > mother_pixel.x:
				px_x = father_pixel.x
				px_y += 1

func get_pixel_color(x, y, image):
	return image.get_pixel(x, y)

func update_all_canvas():
	var canvasx = CanvasManager.data["canvas"]["canvasx"]
	var canvasy = CanvasManager.data["canvas"]["canvasy"]

	var layers = CanvasManager.data["canvas"]["layers_cant"]

	var ly = 1
	var x = 0
	var y = 0

	var pixels_per_layer = canvasx * canvasy
	var needed_pixels = pixels_per_layer * layers

	while ly <= layers:
		var pixel_case = "px_" + str(x) + "_" + str(y)
		var layer_case = "layer_" + str(ly)
		var image = local_data["canvas"][layer_case]["image"]
		var texture = local_data["canvas"][layer_case]["texture"]

		var new_color = CanvasManager.data["canvas"][layer_case]["pixels"][pixel_case]["color"]
		paint_pixel(x, y, ly, new_color, image, texture, false, false, false)

		x += 1
		if x >= canvasx:
			x = 0
			y += 1
		if y == canvasy:
			x = 0
			y = 0
			ly += 1

func paint_neighbor_pixels(pixel_x, pixel_y, layer, canvas_image, texture, sprite, old_color, selected_color):

	var topn = Vector2(pixel_x, pixel_y - 1)
	var downn = Vector2(pixel_x, pixel_y + 1)
	var leftn = Vector2(pixel_x - 1, pixel_y)
	var rightn = Vector2(pixel_x + 1, pixel_y)

	paint_pixel(pixel_x, pixel_y, layer, selected_color, canvas_image, texture, false, true, true)

	var layer_case_name = "layer_" + str(layer)

	var layer_ff = CanvasManager.data["canvas"][layer_case_name]["ff_numb"]
	var actual_pixel_case = "px_" + str(pixel_x) + "_" + str(pixel_y)
	CanvasManager.data["canvas"][layer_case_name]["pixels"][actual_pixel_case]["flood_fill"] = layer_ff

	var canvasx = CanvasManager.data["canvas"]["canvasx"]
	var canvasy = CanvasManager.data["canvas"]["canvasy"]

	var topn_color
	var downn_color
	var leftn_color
	var rightn_color

	var topn_case = "px_" + str(topn.x) + "_" + str(topn.y)
	var downn_case = "px_" + str(downn.x) + "_" + str(downn.y)
	var leftn_case = "px_" + str(leftn.x) + "_" + str(leftn.y)
	var rightn_case = "px_" + str(rightn.x) + "_" + str(rightn.y)

	var topn_exist = CanvasManager.data["canvas"][layer_case_name]["pixels"].has(topn_case)
	var downn_exist = CanvasManager.data["canvas"][layer_case_name]["pixels"].has(downn_case)
	var leftn_exist = CanvasManager.data["canvas"][layer_case_name]["pixels"].has(leftn_case)
	var rightn_exist = CanvasManager.data["canvas"][layer_case_name]["pixels"].has(rightn_case)

	if topn_exist:
		topn_color = CanvasManager.data["canvas"][layer_case_name]["pixels"][topn_case]["color"]
	if downn_exist:
		downn_color = CanvasManager.data["canvas"][layer_case_name]["pixels"][downn_case]["color"]
	if leftn_exist:
		leftn_color = CanvasManager.data["canvas"][layer_case_name]["pixels"][leftn_case]["color"]
	if rightn_exist:
		rightn_color = CanvasManager.data["canvas"][layer_case_name]["pixels"][rightn_case]["color"]

	var topn_ff
	var downn_ff
	var leftn_ff
	var rightn_ff

	if topn_exist:
		topn_ff = CanvasManager.data["canvas"][layer_case_name]["pixels"][topn_case]["flood_fill"]
	if downn_exist:
		downn_ff = CanvasManager.data["canvas"][layer_case_name]["pixels"][downn_case]["flood_fill"]
	if leftn_exist:
		leftn_ff = CanvasManager.data["canvas"][layer_case_name]["pixels"][leftn_case]["flood_fill"]
	if rightn_exist:
		rightn_ff = CanvasManager.data["canvas"][layer_case_name]["pixels"][rightn_case]["flood_fill"]


	if topn_color == old_color and topn_exist and topn_ff < layer_ff:
		paint_neighbor_pixels(topn.x, topn.y, layer, canvas_image, texture, sprite, old_color, selected_color)
	if downn_color == old_color and downn_exist and downn_ff < layer_ff:
		paint_neighbor_pixels(downn.x, downn.y, layer, canvas_image, texture, sprite, old_color, selected_color)
	if leftn_color == old_color and leftn_exist and leftn_ff < layer_ff:
		paint_neighbor_pixels(leftn.x, leftn.y, layer, canvas_image, texture, sprite, old_color, selected_color)
	if rightn_color == old_color and rightn_exist and rightn_ff < layer_ff:
		paint_neighbor_pixels(rightn.x, rightn.y, layer, canvas_image, texture, sprite, old_color, selected_color)

	"\n\tEXPLICACION:\n\t\tCada layer (capa) tiene en CanvasManager guardado un numero llamado \"ff_numb\"\n\t\tcada vez que se usa la cubeta este numero aumenta,\n\t\ty todos los pixeles que son pintados por esta accion pasan a tener el mismo ff_numb que el de su capa.\n\t\t\n\t\tEsto se hace para saber que pixeles ya han sido pintados y evitar generar un bucle,\n\t\tes por eso que en codigo se tiene en cuenta ese numero para saber si hay que pintar x pixel vecino o ya\n\t\tha sido pintado.\n\t\t\n\t"
