extends Node2D


func _ready() -> void :
	$splash.visible = true
	update_colors()
	load_scene()

	var undo_numb = CanvasManager.data["canvas"]["undo_numb"]

	UnsavedChangesChecker.saved_action_numb = undo_numb
	MouseSupervisor.canvas_sprite = $Canvas / NRPixelContainer / canvas
	MouseSupervisor.windows_page = $windows
	MouseSupervisor.about_page = $about
	MouseSupervisor.check_updates_page = $check_updates

func update_colors():
	var updated_interface = Config.visual_parameters["interface_color"]
	var updated_background = Config.visual_parameters["background_color"]
	$interface / layers.modulate = updated_interface

	$interface / layers.modulate = updated_interface

	$ViewportBorder / LineBottom.modulate = updated_interface
	$ViewportBorder / LineRight.modulate = updated_interface
	$ViewportBorder / LineLeft.modulate = updated_interface

	$border / options / Save / Box / Top / inside.modulate = updated_background
	$border / options / Save / Box / Middle / inside.modulate = updated_background
	$border / options / Save / Box / Bottom / inside.modulate = updated_background
	$border / options / File / Box / Top / inside.modulate = updated_background
	$border / options / File / Box / Middle / inside.modulate = updated_background
	$border / options / File / Box / Bottom / inside.modulate = updated_background

	$border / options / Save / Box / Top / border.modulate = updated_interface
	$border / options / Save / Box / Middle / border.modulate = updated_interface
	$border / options / Save / Box / Bottom / border.modulate = updated_interface
	$border / options / File / Box / Top / border.modulate = updated_interface
	$border / options / File / Box / Middle / border.modulate = updated_interface
	$border / options / File / Box / Bottom / border.modulate = updated_interface

	$interface / colours / sliders / h / border.modulate = updated_interface
	$interface / colours / sliders / s / border.modulate = updated_interface
	$interface / colours / sliders / v / border.modulate = updated_interface
	$interface / colours / sliders / hsvcolor / border.modulate = updated_interface

	$interface / colours / hex_color / hexcolor / border.modulate = updated_interface

	$interface / colours / colours.modulate = updated_interface
	$interface / tools / tools.modulate = updated_interface

	$interface / tools / tool01 / border.modulate = updated_interface
	$interface / tools / tool02 / border.modulate = updated_interface
	$interface / tools / tool03 / border.modulate = updated_interface
	$interface / tools / tool04 / border.modulate = updated_interface
	$interface / tools / tool04 / color / border.modulate = updated_interface

	$interface / tools / tool01 / icon.modulate = updated_interface
	$interface / tools / tool02 / icon.modulate = updated_interface
	$interface / tools / tool03 / icon.modulate = updated_interface
	$interface / tools / tool04 / icon.modulate = updated_interface

	$interface / tools_settings / toolssettings.modulate = updated_interface





	$windows / ExitWithoutSaving / border.modulate = updated_interface
	$windows / ExitWithoutSaving / inside.modulate = updated_background
	$windows / ExitWithoutSaving / Button01 / button.modulate = updated_interface
	$windows / ExitWithoutSaving / Button02 / button.modulate = updated_interface
	$windows / ExitWithoutSaving / Button03 / button.modulate = updated_interface
	$windows / ExitWithoutSaving / Button01 / text.modulate = updated_interface
	$windows / ExitWithoutSaving / Button02 / text.modulate = updated_interface
	$windows / ExitWithoutSaving / Button03 / text.modulate = updated_interface


	$windows / ImageSavingOptions / border.modulate = updated_interface
	$windows / ImageSavingOptions / inside.modulate = updated_background
	$windows / ImageSavingOptions / Button03 / button.modulate = updated_interface
	$windows / ImageSavingOptions / Button01 / button.modulate = updated_interface
	$windows / ImageSavingOptions / Button01 / text.modulate = updated_interface
	$windows / ImageSavingOptions / Button03 / text.modulate = updated_interface


	$windows / OpenWithoutSaving / border.modulate = updated_interface
	$windows / OpenWithoutSaving / inside.modulate = updated_background
	$windows / OpenWithoutSaving / Button01.modulate = updated_interface
	$windows / OpenWithoutSaving / Button02.modulate = updated_interface
	$windows / OpenWithoutSaving / Button03.modulate = updated_interface

	$border / options / Help / Box / Top / border.modulate = updated_interface
	$border / options / Help / Box / Middle / border.modulate = updated_interface
	$border / options / Help / Box / Bottom / border.modulate = updated_interface
	$border / options / Help / Box / Top / inside.modulate = updated_background
	$border / options / Help / Box / Middle / inside.modulate = updated_background
	$border / options / Help / Box / Bottom / inside.modulate = updated_background

	$about / content / exit_button.modulate = updated_interface

	$check_updates / content / new_update_alert / border.modulate = updated_interface
	$check_updates / content / new_update_alert / download / button.modulate = updated_interface
	$check_updates / content / new_update_alert / download / text.modulate = updated_interface
	$check_updates / content / exit_button.modulate = updated_interface

func load_scene():
	$loading_time.start()

func _on_loading_time_timeout() -> void :
	$splash.visible = false
