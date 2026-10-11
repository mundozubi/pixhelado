extends Node2D


func _ready() -> void:
	$splash.visible = true
	update_colors()
	load_scene()
	
	var undo_numb = CanvasManager.data["canvas"]["undo_numb"]
	
	UnsavedChangesChecker.saved_action_numb = undo_numb
	MouseSupervisor.canvas_sprite = $Canvas/NRPixelContainer/canvas
	MouseSupervisor.windows_page = $windows
	MouseSupervisor.about_page = $about
	MouseSupervisor.check_updates_page = $check_updates

func update_colors():
	var updated_interface = Config.visual_parameters["interface_color"]
	var updated_background = Config.visual_parameters["background_color"]
	
	get_tree().call_group("interface_color", "set", "modulate", updated_interface)
	get_tree().call_group("background_color", "set", "modulate", updated_background)

func load_scene():
	$loading_time.start()

func _on_loading_time_timeout() -> void:
	$splash.visible = false
