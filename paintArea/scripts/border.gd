extends PanelContainer

var moving = false
var mouse_start:Vector2i

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == 1:
		if !moving:
			mouse_start = get_viewport().get_mouse_position()
		moving = event.is_pressed()

func _process(_delta: float) -> void:
	if moving:
		var mouse_now = Vector2i(get_viewport().get_mouse_position())
		get_window().position += mouse_now - mouse_start


func _on_close_pressed() -> void:
	var i = UnsavedChangesChecker.has_unsaved_changes()
	if i:
		var result = await UnsavedChangesChecker.check_unsaved_changes("exit_without")
		match result:
			"cancel":
				return
			"exit":
				get_tree().quit()
			"save_and_exit":
				$"../scripts/SaveProject".save_project(result)
	else:
		get_tree().quit()
