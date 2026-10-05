extends Control

func _ready() -> void :
	UnsavedChangesChecker.windows = $"."
	UnsavedChangesChecker.exit_without = $ExitWithoutSaving
	UnsavedChangesChecker.open_without = $OpenWithoutSaving

func _on_exit_pressed() -> void :
	UnsavedChangesChecker.emit_signal("decision", "exit")
	$".".visible = false
	$ExitWithoutSaving.visible = false


func _on_save_and_exit_pressed() -> void :
	UnsavedChangesChecker.emit_signal("decision", "save_and_exit")
	$".".visible = false
	$ExitWithoutSaving.visible = false


func _on_cancel_pressed() -> void :
	UnsavedChangesChecker.emit_signal("decision", "cancel")
	$".".visible = false
	$ExitWithoutSaving.visible = false
	$OpenWithoutSaving.visible = false


func _on_open_new_project_pressed() -> void :
	UnsavedChangesChecker.emit_signal("decision", "open_new_project")
	$".".visible = false
	$OpenWithoutSaving.visible = false


func _on_save_and_open_pressed() -> void :
	UnsavedChangesChecker.emit_signal("decision", "save_and_open")
	$".".visible = false
	$OpenWithoutSaving.visible = false
