extends Node

var saved_action_numb:int = 0

var windows:Control = null
var exit_without:Control = null
var open_without:Control = null

signal decision(result)

func check_unsaved_changes(window_type):
	var undo_numb = CanvasManager.data["canvas"]["undo_numb"]
	if saved_action_numb < undo_numb:
		match window_type:
			"exit_without":
				open_exit_without_saving_window()
			"open_without":
				open_open_without_saving_window()
				
		var result = await decision
		return result
	else:
		return "nothing_to_save"
		

func open_exit_without_saving_window():
	windows.visible = true
	exit_without.visible = true

func open_open_without_saving_window():
	windows.visible = true
	open_without.visible = true

func has_unsaved_changes():
	var undo_numb = CanvasManager.data["canvas"]["undo_numb"]
	if saved_action_numb < undo_numb:
		return true
	else:
		return false

func reset():
	var undo_numb = CanvasManager.data["canvas"]["undo_numb"]
	saved_action_numb = undo_numb
