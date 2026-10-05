extends Node

var active = preload("res://sources/interface/layer_button_pressed.png")
var inactive = preload("res://sources/interface/layer_button.png")

var eye_open = preload("res://sources/interface/eye.png")
var eye_closed = preload("res://sources/interface/closed_eye.png")

var small_pressed = preload("res://sources/interface/color_button_border_pressed.png")
var small_notPressed = preload("res://sources/interface/color_button_border.png")

var onion_skin_opacity = Color(1, 1, 1, 0.5)
var def_opacity = Color(1, 1, 1, 1)

var can_onion_skin: bool = true
var force_def_modulate: bool = false

func _ready() -> void :
	CanvasManager.data["canvas"]["onion_skin"] = ""
	CanvasManager.data["canvas"]["onion_skin"] = false


func _process(delta: float) -> void :
	var active_layer = CanvasManager.data["canvas"]["active_layer"]
	var onion_skin = CanvasManager.data["canvas"]["onion_skin"]

	if onion_skin and can_onion_skin and not force_def_modulate:
		$"../../../Canvas/RPixelContainer/rp_layer_01".modulate = onion_skin_opacity
		$"../../../Canvas/RPixelContainer/rp_layer_02".modulate = onion_skin_opacity
		$"../../../Canvas/RPixelContainer/rp_layer_03".modulate = onion_skin_opacity
		$"../../../Canvas/RPixelContainer/rp_layer_04".modulate = onion_skin_opacity
	else:
		$"../../../Canvas/RPixelContainer/rp_layer_01".modulate = def_opacity
		$"../../../Canvas/RPixelContainer/rp_layer_02".modulate = def_opacity
		$"../../../Canvas/RPixelContainer/rp_layer_03".modulate = def_opacity
		$"../../../Canvas/RPixelContainer/rp_layer_04".modulate = def_opacity

	if force_def_modulate:
		$"../../../Canvas/RPixelContainer/rp_layer_01".modulate = def_opacity
		$"../../../Canvas/RPixelContainer/rp_layer_02".modulate = def_opacity
		$"../../../Canvas/RPixelContainer/rp_layer_03".modulate = def_opacity
		$"../../../Canvas/RPixelContainer/rp_layer_04".modulate = def_opacity

	if active_layer == 1:
		$"../../../interface/layers/layer00".texture = active
		$"../../../interface/layers/layer00/content".position.y = 2
		$"../../../Canvas/RPixelContainer/rp_layer_01".modulate = def_opacity
	else:
		$"../../../interface/layers/layer00".texture = inactive
		$"../../../interface/layers/layer00/content".position.y = 0

	if active_layer == 2:
		$"../../../interface/layers/layer01".texture = active
		$"../../../interface/layers/layer01/content".position.y = 2
		$"../../../Canvas/RPixelContainer/rp_layer_02".modulate = def_opacity
	else:
		$"../../../interface/layers/layer01".texture = inactive
		$"../../../interface/layers/layer01/content".position.y = 0

	if active_layer == 3:
		$"../../../interface/layers/layer02".texture = active
		$"../../../interface/layers/layer02/content".position.y = 2
		$"../../../Canvas/RPixelContainer/rp_layer_03".modulate = def_opacity
	else:
		$"../../../interface/layers/layer02".texture = inactive
		$"../../../interface/layers/layer02/content".position.y = 0

	if active_layer == 4:
		$"../../../interface/layers/layer03".texture = active
		$"../../../interface/layers/layer03/content".position.y = 2
		$"../../../Canvas/RPixelContainer/rp_layer_04".modulate = def_opacity
	else:
		$"../../../interface/layers/layer03".texture = inactive
		$"../../../interface/layers/layer03/content".position.y = 0

func update_eye_icon():
	if not $"../../../Canvas/RPixelContainer/rp_layer_01".visible:
		$"../../../interface/layers/layer00/content/eye".texture = eye_closed
	else:
		$"../../../interface/layers/layer00/content/eye".texture = eye_open

	if not $"../../../Canvas/RPixelContainer/rp_layer_02".visible:
		$"../../../interface/layers/layer01/content/eye".texture = eye_closed
	else:
		$"../../../interface/layers/layer01/content/eye".texture = eye_open

	if not $"../../../Canvas/RPixelContainer/rp_layer_03".visible:
		$"../../../interface/layers/layer02/content/eye".texture = eye_closed
	else:
		$"../../../interface/layers/layer02/content/eye".texture = eye_open

	if not $"../../../Canvas/RPixelContainer/rp_layer_04".visible:
		$"../../../interface/layers/layer03/content/eye".texture = eye_closed
	else:
		$"../../../interface/layers/layer03/content/eye".texture = eye_open


func _on_button_00_pressed() -> void :
	CanvasManager.data["canvas"]["active_layer"] = 1


func _on_button_01_pressed() -> void :
	CanvasManager.data["canvas"]["active_layer"] = 2


func _on_button_02_pressed() -> void :
	CanvasManager.data["canvas"]["active_layer"] = 3


func _on_button_03_pressed() -> void :
	CanvasManager.data["canvas"]["active_layer"] = 4

func onion_button_update():
	var onion_skin = CanvasManager.data["canvas"]["onion_skin"]
	if onion_skin:
		$"../../../interface/layers/onion".texture = small_pressed
		$"../../../interface/layers/onion/onion_icon".position.y = 0.6
	elif not onion_skin:
		$"../../../interface/layers/onion".texture = small_notPressed
		$"../../../interface/layers/onion/onion_icon".position.y = -0.6

func _on_onion_button_pressed() -> void :
	var onion_skin = CanvasManager.data["canvas"]["onion_skin"]
	if onion_skin == true:
		CanvasManager.data["canvas"]["onion_skin"] = false
		onion_button_update()
	elif onion_skin == false:
		CanvasManager.data["canvas"]["onion_skin"] = true
		onion_button_update()


func _on_eye_button_00_pressed() -> void :
	if $"../../../Canvas/RPixelContainer/rp_layer_01".visible:
		$"../../../Canvas/RPixelContainer/rp_layer_01".visible = false
		update_eye_icon()
	else:
		$"../../../Canvas/RPixelContainer/rp_layer_01".visible = true
		update_eye_icon()


func _on_eye_button_01_pressed() -> void :
	if $"../../../Canvas/RPixelContainer/rp_layer_02".visible:
		$"../../../Canvas/RPixelContainer/rp_layer_02".visible = false
		update_eye_icon()
	else:
		$"../../../Canvas/RPixelContainer/rp_layer_02".visible = true
		update_eye_icon()


func _on_eye_button_02_pressed() -> void :
	if $"../../../Canvas/RPixelContainer/rp_layer_03".visible:
		$"../../../Canvas/RPixelContainer/rp_layer_03".visible = false
		update_eye_icon()
	else:
		$"../../../Canvas/RPixelContainer/rp_layer_03".visible = true
		update_eye_icon()


func _on_eye_button_03_pressed() -> void :
	if $"../../../Canvas/RPixelContainer/rp_layer_04".visible:
		$"../../../Canvas/RPixelContainer/rp_layer_04".visible = false
		update_eye_icon()
	else:
		$"../../../Canvas/RPixelContainer/rp_layer_04".visible = true
		update_eye_icon()
