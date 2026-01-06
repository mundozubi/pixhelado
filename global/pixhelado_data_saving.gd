extends Node2D

var appdata = OS.get_data_dir()
var dir = DirAccess.open(appdata)

var save_data_path = appdata+"/Mundozubi/PixHelado/"

var projects:Dictionary = {
	"logged_ids" = []
}

var preferences:Dictionary = {
	"image_saving" = {
		"export_format_option": 0,
		"recall_choice": false
	}
}

var version_numb = 1
var version = "0.3.0"

var logged_ids

func _ready() -> void:
	check_files()
	load_data()

func check_files():
	if not dir.dir_exists("Mundozubi"):
		dir.make_dir("Mundozubi")
	
	if not dir.dir_exists("Mundozubi/PixHelado"):
		dir.make_dir("Mundozubi/PixHelado")
	
	if not dir.dir_exists("Mundozubi/PixHelado/projects"):
		dir.make_dir("Mundozubi/PixHelado/projects")

func save_data(type):
	match type:
		"preferences":
			var path = save_data_path+"preferences.dat"
			var file = FileAccess.open(path, FileAccess.WRITE)
			
			file.store_var(preferences)
			file.close()

func load_data():
	# preferencias
	var path = save_data_path+"preferences.dat"
	var file = FileAccess.open(path, FileAccess.READ)
	
	if file != null:
		preferences = file.get_var()
		file.close()
	else:
		save_data("preferences")
