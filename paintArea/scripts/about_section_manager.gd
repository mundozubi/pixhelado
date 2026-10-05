extends Control

var version_numb
var version
var download_link = ""

func _ready() -> void :
	version_numb = PDS.version_numb
	version = PDS.version

	$HTTPRequest.request("https://mundozubi.com/data/pixhelado.json")


func _on_email_link_pressed() -> void :
	OS.shell_open("mailto:mundozubi@gmail.com")


func _on_mundozubi_link_pressed() -> void :
	OS.shell_open("https://mundozubi.com")


func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void :
	if response_code != 200:
		print("HTTP Error:", response_code)
		return

	var json_text = body.get_string_from_utf8()
	var data = JSON.parse_string(json_text)

	if data == null:
		print("Error reading JSON")
		return

	$new_update_alert.visible = data["version_numb"] > version_numb
	$new_update_alert / version.text = data["version_name"]
	download_link = data["version_download_link"]


func _on_update_button_pressed() -> void :
	OS.shell_open(download_link)


func _on_exit_pressed() -> void :
	$".".visible = false
