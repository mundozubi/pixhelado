extends Node

var info: Dictionary = {
	"version" = "0.3.1", 
	"program" = "pixhelado", 
	"company" = "mundozubi"
}

var canvas: Dictionary = {
}

var data: Dictionary = {
	"canvas" = {
		"layers_cant" = 0, 
		"undo_numb" = 1
	}
}

var enable_painting: bool = true

var canvasx: int
var canvasy: int

func _ready() -> void :
	pass

"\nEstructura base de datos 'data' de CanvasManager\n\nDATA\n-canvas\n--layer_0\n--layer_1\n--etc\n\n\n"
