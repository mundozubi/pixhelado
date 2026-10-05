extends Area2D

@export var type: int = 0


func _ready() -> void :

	if type == 0:
		$Sprite.modulate = Color("#fff")
	elif type == 1:
		$Sprite.modulate = Color("#f7f7f7")
