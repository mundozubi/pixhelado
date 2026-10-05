extends Node


var active_option: int = 0
var active_window_option: int = 0

func _ready() -> void :
	update_options()
	update_windows_options()

func _process(delta: float) -> void :
	CanvasManager.enable_painting = active_option == 0

func _on_file_button_pressed() -> void :
	if active_option == 1:
		active_option = 0
	else:
		active_option = 1
	update_options()

func _on_save_button_pressed() -> void :
	if active_option == 2:
		active_option = 0
	else:
		active_option = 2
	update_options()

func _on_help_button_pressed() -> void :
	if active_option == 3:
		active_option = 0
	else:
		active_option = 3
	update_options()

func update_options():
	$"../../border/options/File/Box".visible = active_option == 1
	$"../../border/options/Save/Box".visible = active_option == 2
	$"../../border/options/Help/Box".visible = active_option == 3
	if active_option != 3 and active_option != 0:
		$"../../about".visible = false
	if active_option != 3 and active_option != 0:
		$"../../check_updates".visible = false

func update_windows_options():
	$"../../interface/colours".visible = active_window_option == 0
	$"../../interface/tools_settings".visible = active_window_option == 1
	$"../../border/windows_options/colours/bg".visible = active_window_option == 0
	$"../../border/windows_options/settings/bg".visible = active_window_option == 1


func _on_save_image_button_pressed() -> void :
	$"../ScreenShotScript".open_image_saving_win()
	active_option = 0
	update_options()


func restart_canvaspx_pos():
	var canvas = $"../../Canvas"
	var node_parent = $"../../Canvas/ssAreaContainer/ssArea"
	var node = $"../../Canvas/ssAreaContainer/ssArea/RPixelContainer"
	var rpixelc = $"../../Canvas/RPixelContainer"
	var copy = node.duplicate()
	var goal = $"../../Canvas"

	copy.position.x = 0
	copy.position.y = 0
	canvas.add_child(copy)

	var node_children = node_parent.get_children()
	var del_child = node_children[0]
	node_parent.remove_child(del_child)

	active_option = 0
	update_options()


func _on_load_project_button_pressed() -> void :
	active_option = 0
	update_options()
	var i = UnsavedChangesChecker.has_unsaved_changes()
	if i:
		var result = await UnsavedChangesChecker.check_unsaved_changes("open_without")
		match result:
			"cancel":
				return
			"open_new_project":
				$"../LoadProject".prepare_project_loading()
				active_option = 0
				update_options()
			"save_and_open":
				$"../SaveProject".save_project(result)
	elif not i:
		$"../LoadProject".prepare_project_loading()
		active_option = 0
		update_options()

func reset_active_option():
	active_option = 0
	update_options()


func _on_new_project_button_pressed() -> void :
	get_tree().change_scene_to_file("res://paintArea/paint_area.tscn")



func _on_colours_pressed() -> void :
	active_window_option = 0
	update_windows_options()

func _on_settings_pressed() -> void :
	active_window_option = 1
	update_windows_options()


func _on_about_pressed() -> void :
	$"../../about".visible = true
	$"../../check_updates".visible = false
	active_option = 0
	update_options()

func _on_check_updates_pressed() -> void :
	$"../../check_updates".visible = true
	$"../../about".visible = false
	$"../../check_updates".check_updates()
	active_option = 0
	update_options()
