extends Node2D

@export var canvasy = 32
@export var canvasx = 32
@export var grid_color = Color(0, 0, 0, 0.1)
@export var grid_enabled = true

func _ready() -> void :
	canvasx = CanvasManager.data["canvas"]["canvasx"]
	canvasy = CanvasManager.data["canvas"]["canvasx"]
	queue_redraw()

func _draw():
	if not grid_enabled:
		return

	for x in range(canvasx + 1):
		draw_line(Vector2(x, 0), Vector2(x, canvasy), grid_color, 0.1)

	for y in range(canvasy + 1):
		draw_line(Vector2(0, y), Vector2(canvasx, y), grid_color, 0.1)
