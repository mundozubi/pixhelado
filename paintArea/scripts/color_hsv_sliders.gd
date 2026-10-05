extends Node2D


func _ready() -> void :
	$hsvcolor / AnimationPlayer.play("inactive")

func _process(delta: float) -> void :
	var h = $h / HSlider.value / 100
	var s = $s / HSlider.value / 100
	var v = $v / HSlider.value / 100

	MouseSupervisor.hsv_color.h = h
	MouseSupervisor.hsv_color.s = s
	MouseSupervisor.hsv_color.v = v

	var hcolor = Color.from_hsv(h, 1, 1)

	$hsvcolor / inside.modulate = MouseSupervisor.hsv_color




	if MouseSupervisor.selected_type_of_color == 1:
		$hsvcolor / AnimationPlayer.play("pressed")
	else:
		$hsvcolor / AnimationPlayer.play("inactive")


func _on_hsvcolor_button_pressed() -> void :
	if MouseSupervisor.selected_type_of_color != 1:
		MouseSupervisor.selected_type_of_color = 1
	else:
		MouseSupervisor.selected_type_of_color = 0

func update_button_icon():
	pass
