extends Control


var active_window_option

func _process(delta: float) -> void :
	active_window_option = $"../../scripts/BorderOptionsManager".active_window_option
	var active = active_window_option == 1

	if active and $brush_size / input.text != "":
		ToolsSettings.tSettings["brush_size"] = int($brush_size / input.text)
	else:
		$brush_size / input.text = ""
		$brush_size / input.placeholder_text = str(ToolsSettings.tSettings["brush_size"])
