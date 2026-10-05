extends Control

func _ready() -> void :
	update_button_icons()

func _process(delta: float) -> void :
	$tool04 / color / inside.modulate = MouseSupervisor.dropper_selected_color

	if MouseSupervisor.selected_type_of_color == 3:
		$tool04 / color.visible = true
	else:
		$tool04 / color.visible = false

	update_button_icons()

func update_button_icons():
	if MouseSupervisor.selected_tool == 0:
		$tool01 / AnimationPlayer.play("pressed")
		$tool01 / icon.position.y = 3
	else:
		$tool01 / AnimationPlayer.play("inactive")
		$tool01 / icon.position.y = -2

	if MouseSupervisor.selected_tool == 1:
		$tool02 / AnimationPlayer.play("pressed")
		$tool02 / icon.position.y = 3
	else:
		$tool02 / AnimationPlayer.play("inactive")
		$tool02 / icon.position.y = -2

	if MouseSupervisor.selected_tool == 2:
		$tool03 / AnimationPlayer.play("pressed")
		$tool03 / icon.position.y = 3
	else:
		$tool03 / AnimationPlayer.play("inactive")
		$tool03 / icon.position.y = -2

	if MouseSupervisor.selected_tool == 3:
		$tool04 / AnimationPlayer.play("pressed")
		$tool04 / icon.position.y = 3
	else:
		$tool04 / AnimationPlayer.play("inactive")
		$tool04 / icon.position.y = -2

func _on_tool_01_button_pressed() -> void :
	if MouseSupervisor.selected_tool != 0:
		MouseSupervisor.selected_tool = 0
	else:
		MouseSupervisor.selected_tool = 0
	update_button_icons()


func _on_tool_02_button_pressed() -> void :
	if MouseSupervisor.selected_tool != 1:
		MouseSupervisor.selected_tool = 1
	else:
		MouseSupervisor.selected_tool = 0
	update_button_icons()


func _on_tool_03_button_pressed() -> void :
	if MouseSupervisor.selected_tool != 2:
		MouseSupervisor.selected_tool = 2
	else:
		MouseSupervisor.selected_tool = 0
	update_button_icons()


func _on_tool_04_button_pressed() -> void :
	if MouseSupervisor.selected_tool != 3:
		MouseSupervisor.selected_tool = 3

		MouseSupervisor.selected_type_of_color = 3
		$"../colours/sliders".update_button_icon()
		$"../colours/hex_color".update_button_icon()
	else:
		MouseSupervisor.selected_tool = 0
	update_button_icons()
