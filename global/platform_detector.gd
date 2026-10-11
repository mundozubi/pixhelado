extends Node2D

var platform:String = "Web"

func _ready() -> void: # Mirar donde se esta usan la app
	platform = OS.get_name()
	print("Running on: ",platform)
