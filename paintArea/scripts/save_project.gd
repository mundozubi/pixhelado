extends Node

@onready var file_dialog = $"../../SaveProject"

var last_condition

func save_project(condition):
	await RenderingServer.frame_post_draw

	last_condition = condition

	var platform = PlatformDetector.platform

	match platform:
		"Windows":
			file_dialog.popup_centered()
			file_dialog.current_dir = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)

			$"../BorderOptionsManager".reset_active_option()

		"Web":
			var data = CanvasManager.data["canvas"]
			var buffer = var_to_bytes(data)
			var b64 = Marshalls.raw_to_base64(buffer)
			download_file_web("my_painting.pxhelado", b64)

func _on_save_project_file_selected(path: String) -> void :
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

func _on_save_project_button_pressed() -> void :
	save_project(null)
	$"../BorderOptionsManager".active_option = 0
	$"../BorderOptionsManager".update_options()

func download_file_web(filename, content):
	var js = """
	const filename = \"%s\";
	const text = `%s`;
	const element = document.createElement('a');
	element.href = 'data:text/plain;charset=utf-8,' + encodeURIComponent(text);
	element.download = filename;
	element.click();""" %[filename, content]
	JavaScriptBridge.eval(js)
