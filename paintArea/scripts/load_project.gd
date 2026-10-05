extends Node

@onready var file_dialog = $"../../LoadProject"

func prepare_project_loading():
	await RenderingServer.frame_post_draw

	file_dialog.popup_centered()
	file_dialog.current_dir = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)

	$"../BorderOptionsManager".reset_active_option()


func _on_load_project_file_selected(path: String) -> void :
	if path.ends_with(".pxhelado"):
		load_project(path)
	else:
		return

func load_project(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var new_data = file.get_var()
	file.close()

	CanvasManager.data["canvas"] = new_data


	$"../LocalCanvasManager/CanvasGenerator".rebuild_canvas_from_loaded_data()

	$"../LocalCanvasManager".update_all_canvas()

	UnsavedChangesChecker.reset()
	$"../LocalCanvasManager/LayersManager".onion_button_update()
