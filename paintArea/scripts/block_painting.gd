extends Node

func _process(delta: float) -> void :
	if $"../../about".visible:
		CanvasManager.enable_painting = false
		return
	if $"../../check_updates".visible:
		CanvasManager.enable_painting = false
		return
	if $"../../windows".visible:
		CanvasManager.enable_painting = false
		return
