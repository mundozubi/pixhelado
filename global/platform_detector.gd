extends Node2D

var platform: String = "Web"

func _ready() -> void :
	platform = OS.get_name()
	print("Running on: ", platform)
