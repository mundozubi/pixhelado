extends Node

@onready var file_dialog = $"../../SaveProject"

var last_condition

func save_project(condition):
	await  RenderingServer.frame_post_draw
	
	last_condition = condition
	
	file_dialog.popup_centered()
	file_dialog.current_dir = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)
	
	$"../BorderOptionsManager".reset_active_option()
	

func _on_save_project_file_selected(path: String) -> void:
	var data = CanvasManager.data["canvas"]
	var save_path = path
	
	if not path.ends_with(".pxhelado"):
		save_path = path + ".pxhelado"
	else:
		save_path = path
	
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(data)
	file.close()
	
	var undo_numb = CanvasManager.data["canvas"]["undo_numb"]
	UnsavedChangesChecker.saved_action_numb = undo_numb
	
	match last_condition:
		null:
			return
		"save_and_exit":
			get_tree().quit()
		"save_and_open":
			$"../LoadProject".prepare_project_loading()

func _on_save_project_button_pressed() -> void:
	save_project(null)
	$"../BorderOptionsManager".active_option = 0
	$"../BorderOptionsManager".update_options()
