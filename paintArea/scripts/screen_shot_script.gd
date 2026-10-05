extends Node

@onready var file_dialog = $"../../SaveImage"
@onready var viewport = $"../../Canvas/ssAreaContainer/ssArea"
@onready var canvas_node = $"../../Canvas/RPixelContainer"

var rprestart01
var rprestart02
var rprestart03
var rprestart04

var image_saving_config: Dictionary = {
	"export_type" = 0, 
	"image_format" = 0
}

func open_image_saving_win():
	$"../../windows".visible = true
	$"../../windows/ImageSavingOptions".visible = true
	$"../../windows/ImageSavingOptions".read_preferences()

func prepare_screen_shot():
	$"../../splash".visible = true
	rprestart01 = true
	rprestart02 = true
	rprestart03 = true
	rprestart04 = true

	var et = image_saving_config["export_type"]

	if et == 0:
		var canvas_node_copy = canvas_node.duplicate()
		canvas_node.visible = false
		canvas_node_copy.position.x = 0
		canvas_node_copy.position.x = 0

		viewport.add_child(canvas_node_copy)
	elif et == 1:
		if not $"../../Canvas/RPixelContainer/rp_layer_01".visible:
			$"../../Canvas/RPixelContainer/rp_layer_01".visible = true
			rprestart01 = false
		if not $"../../Canvas/RPixelContainer/rp_layer_02".visible:
			$"../../Canvas/RPixelContainer/rp_layer_02".visible = true
			rprestart02 = false
		if not $"../../Canvas/RPixelContainer/rp_layer_03".visible:
			$"../../Canvas/RPixelContainer/rp_layer_03".visible = true
			rprestart03 = false
		if not $"../../Canvas/RPixelContainer/rp_layer_04".visible:
			$"../../Canvas/RPixelContainer/rp_layer_04".visible = true
			rprestart04 = false

		var canvas_node_copy = canvas_node.duplicate()
		canvas_node.visible = false
		canvas_node_copy.position.x = 0
		canvas_node_copy.position.x = 0

		viewport.add_child(canvas_node_copy)
	elif et == 2:
		rprestart01 = $"../../Canvas/RPixelContainer/rp_layer_01".visible
		rprestart02 = $"../../Canvas/RPixelContainer/rp_layer_02".visible
		rprestart03 = $"../../Canvas/RPixelContainer/rp_layer_03".visible
		rprestart04 = $"../../Canvas/RPixelContainer/rp_layer_04".visible

	take_screen_shot()

	if et == 1:
		$"../../Canvas/RPixelContainer/rp_layer_01".visible = rprestart01
		$"../../Canvas/RPixelContainer/rp_layer_02".visible = rprestart02
		$"../../Canvas/RPixelContainer/rp_layer_03".visible = rprestart03
		$"../../Canvas/RPixelContainer/rp_layer_04".visible = rprestart04

func take_screen_shot():
	await RenderingServer.frame_post_draw
	file_dialog.current_dir = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)
	file_dialog.popup_centered()


func _on_save_image_file_selected(path: String) -> void :
	var img = viewport.get_texture().get_image()
	var save_path = path

	var et = image_saving_config["export_type"]
	if et == 2:
		export_layers_in_sprites(path)

	else:
		var ext = path.get_extension().to_lower()
		if ext == "png":
			img.save_png(path)
		elif ext == "jpg":
			img.save_jpg(path)
		elif ext == "webp":
			img.save_webp(path)
		restart_canvas()

func export_layers_in_sprites(path):
	var img = viewport.get_texture().get_image()
	var ext = path.get_extension().to_lower()

	"\n\tvar canvas_node_copy = canvas_node.duplicate()\n\tcanvas_node.visible = false\n\tcanvas_node_copy.position.x = 0\n\tcanvas_node_copy.position.x = 0\n\t\t\n\tviewport.add_child(canvas_node_copy)\n\t"







	var basename = path.get_basename()
	$"../LocalCanvasManager/LayersManager".can_onion_skin = false
	$"../LocalCanvasManager/LayersManager".force_def_modulate = true

	$"../../Canvas/RPixelContainer/rp_layer_01".visible = true
	$"../../Canvas/RPixelContainer/rp_layer_02".visible = false
	$"../../Canvas/RPixelContainer/rp_layer_03".visible = false
	$"../../Canvas/RPixelContainer/rp_layer_04".visible = false
	var canvas_node_copy = canvas_node.duplicate()
	canvas_node_copy.position.x = 0
	canvas_node_copy.position.x = 0
	viewport.add_child(canvas_node_copy)
	await RenderingServer.frame_post_draw
	print($"../../Canvas/RPixelContainer/rp_layer_01".modulate)
	img = viewport.get_texture().get_image()
	var nw_path = basename + "_0." + ext
	match ext:
		"png":
			img.save_png(nw_path)
		"jpg":
			img.save_jpg(nw_path)
		"webp":
			img.save_webp(nw_path)

	$"../../Canvas/RPixelContainer/rp_layer_01".visible = false
	$"../../Canvas/RPixelContainer/rp_layer_02".visible = true
	$"../../Canvas/RPixelContainer/rp_layer_03".visible = false
	$"../../Canvas/RPixelContainer/rp_layer_04".visible = false
	canvas_node_copy = canvas_node.duplicate()
	canvas_node_copy.position.x = 0
	canvas_node_copy.position.x = 0
	var viewport_children = viewport.get_children()
	var canvas_copy = viewport_children[0]
	canvas_copy.queue_free()
	viewport.add_child(canvas_node_copy)
	await RenderingServer.frame_post_draw
	img = viewport.get_texture().get_image()
	nw_path = basename + "_1." + ext
	match ext:
		"png":
			img.save_png(nw_path)
		"jpg":
			img.save_jpg(nw_path)
		"webp":
			img.save_webp(nw_path)

	$"../../Canvas/RPixelContainer/rp_layer_01".visible = false
	$"../../Canvas/RPixelContainer/rp_layer_02".visible = false
	$"../../Canvas/RPixelContainer/rp_layer_03".visible = true
	$"../../Canvas/RPixelContainer/rp_layer_04".visible = false
	canvas_node_copy = canvas_node.duplicate()
	canvas_node_copy.position.x = 0
	canvas_node_copy.position.x = 0
	viewport_children = viewport.get_children()
	canvas_copy = viewport_children[0]
	canvas_copy.queue_free()
	viewport.add_child(canvas_node_copy)
	await RenderingServer.frame_post_draw
	img = viewport.get_texture().get_image()
	nw_path = basename + "_2." + ext
	match ext:
		"png":
			img.save_png(nw_path)
		"jpg":
			img.save_jpg(nw_path)
		"webp":
			img.save_webp(nw_path)

	$"../../Canvas/RPixelContainer/rp_layer_01".visible = false
	$"../../Canvas/RPixelContainer/rp_layer_02".visible = false
	$"../../Canvas/RPixelContainer/rp_layer_03".visible = false
	$"../../Canvas/RPixelContainer/rp_layer_04".visible = true
	canvas_node_copy = canvas_node.duplicate()
	canvas_node_copy.position.x = 0
	canvas_node_copy.position.x = 0
	viewport_children = viewport.get_children()
	canvas_copy = viewport_children[0]
	canvas_copy.queue_free()
	viewport.add_child(canvas_node_copy)
	await RenderingServer.frame_post_draw
	img = viewport.get_texture().get_image()
	nw_path = basename + "_3." + ext
	match ext:
		"png":
			img.save_png(nw_path)
		"jpg":
			img.save_jpg(nw_path)
		"webp":
			img.save_webp(nw_path)

	$"../../Canvas/RPixelContainer/rp_layer_01".visible = rprestart01
	$"../../Canvas/RPixelContainer/rp_layer_02".visible = rprestart02
	$"../../Canvas/RPixelContainer/rp_layer_03".visible = rprestart03
	$"../../Canvas/RPixelContainer/rp_layer_04".visible = rprestart04

	$"../LocalCanvasManager/LayersManager".update_eye_icon()
	$"../LocalCanvasManager/LayersManager".can_onion_skin = true
	$"../LocalCanvasManager/LayersManager".force_def_modulate = false
	restart_canvas()

func _on_save_image_canceled() -> void :
	var viewport_children = viewport.get_children()

	if not viewport_children.is_empty():
		restart_canvas()

func restart_canvas():
	var viewport_children = viewport.get_children()
	var canvas_copy = viewport_children[0]
	canvas_copy.queue_free()
	canvas_node.visible = true

	$"../../splash".visible = false

func _on_accept_imgsav_pressed() -> void :
	$"../../windows".visible = false
	$"../../windows/ImageSavingOptions".visible = false
	image_saving_config["export_type"] = $"../../windows/ImageSavingOptions/ExportType/OptionButton".get_selected_id()
	prepare_screen_shot()

	var recall_choice = PDS.preferences["image_saving"]["recall_choice"]

	if recall_choice:
		PDS.preferences["image_saving"]["export_format_option"] = $"../../windows/ImageSavingOptions/ExportType/OptionButton".get_selected_id()
		PDS.save_data("preferences")


func _on_cancel_imgsav_pressed() -> void :
	$"../../windows".visible = false
	$"../../windows/ImageSavingOptions".visible = false


func _on_recall_pressed() -> void :
	if PDS.preferences["image_saving"]["recall_choice"]:
		PDS.preferences["image_saving"]["recall_choice"] = false

	elif not PDS.preferences["image_saving"]["recall_choice"]:
		PDS.preferences["image_saving"]["recall_choice"] = true

	$"../../windows/ImageSavingOptions".read_preferences()
