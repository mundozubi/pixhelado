extends Node

var appdata = OS.get_data_dir()
var save_path = appdata + "/Mundozubi/pixHelado/alpha0.1/" + "config.dat"
var dir = DirAccess.open(appdata)

var visual_parameters:Dictionary = {
	"interface_color" = Color("#ff9900"),
	"background_color" = Color("#212121")
}

func read():
	var file = FileAccess.open(save_path, FileAccess.READ)
	
	visual_parameters = file.get_var()
	file.close()

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	
	file.store_var(visual_parameters)
	file.close()
