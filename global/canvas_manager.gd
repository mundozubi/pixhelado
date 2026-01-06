extends Node

var info:Dictionary = {
	"version" = "0.3.0",
	"program" = "pixhelado",
	"company" = "mundozubi"
}

var canvas:Dictionary = {
}

var data:Dictionary = {
	"canvas" = {
		"layers_cant" = 0,
		"undo_numb" = 1
	}
}

var canvasx:int
var canvasy:int

func _ready() -> void:
	pass

"""
Estructura base de datos 'data' de CanvasManager

DATA
-canvas
--layer_0
--layer_1
--etc


"""
