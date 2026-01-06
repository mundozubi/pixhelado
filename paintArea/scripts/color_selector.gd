extends Node

var selected_color_numb:int = 0


func _process(delta: float) -> void:
	pass


func _on_button_00_pressed() -> void:
	selected_color_numb = 0
	MouseSupervisor.selected_color = Color("#ffff00")


func _on_button_01_pressed() -> void:
	selected_color_numb = 1
	MouseSupervisor.selected_color = Color("#ff0000")


func _on_button_02_pressed() -> void:
	selected_color_numb = 2
	MouseSupervisor.selected_color = Color("#ff9900")


func _on_button_03_pressed() -> void:
	selected_color_numb = 3
	MouseSupervisor.selected_color = Color("#000")


func _on_button_04_pressed() -> void:
	selected_color_numb = 4
	MouseSupervisor.selected_color = Color("#676767")


func _on_button_05_pressed() -> void:
	selected_color_numb = 5
	MouseSupervisor.selected_color = Color("#fff")
