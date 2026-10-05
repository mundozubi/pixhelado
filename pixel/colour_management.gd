extends Node

var color = Color(1, 1, 0, 0)
var default_color = Color(1, 1, 0, 0)
var mouse_entered: bool = false

var id: int
var case

@onready var pixel = get_parent()

func _ready() -> void :
	pass


func _process(delta: float) -> void :


	if mouse_entered and MouseSupervisor.left_input and MouseSupervisor.selected_tool == 0:
		color = MouseSupervisor.selected_color
		pixel.change_color_to(color)
	elif mouse_entered and MouseSupervisor.right_input and MouseSupervisor.selected_tool == 0:
		color = default_color
		pixel.change_color_to(color)



	if mouse_entered and MouseSupervisor.left_input and MouseSupervisor.selected_tool == 1:
		color = default_color
		pixel.change_color_to(color)


	if mouse_entered and MouseSupervisor.left_input and MouseSupervisor.selected_tool == 2:
		var selected_color = MouseSupervisor.selected_color
		pixel.colour_neighboor_pixels(selected_color)
	elif mouse_entered and MouseSupervisor.right_input and MouseSupervisor.selected_tool == 2:
		var selected_color = default_color
		pixel.colour_neighboor_pixels(selected_color)


	if mouse_entered and MouseSupervisor.left_input and MouseSupervisor.selected_tool == 3:
		pixel.get_color()



func _on_pixel_mouse_entered() -> void :
	mouse_entered = true

func _on_pixel_mouse_exited() -> void :
	mouse_entered = false
