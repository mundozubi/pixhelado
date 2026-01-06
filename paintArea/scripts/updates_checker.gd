extends Control

@onready var title = $content/title

var version_numb
var download_link

func check_updates():
	$content/title.text = "Checking for updates..."
	$content/title.visible = true
	$content/new_update_alert.visible = false
	version_numb = PDS.version_numb
	$HTTPRequest.request("https://mundozubi.com/data/pixhelado.json")


func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if response_code != 200:
		print("HTTP Error:", response_code)
		return
		
	var json_text = body.get_string_from_utf8()
	var data = JSON.parse_string(json_text)
	
	if data == null:
		print("Error reading JSON")
		return
	
	
	$content/new_update_alert.visible = data["version_numb"] > version_numb
	$content/title.visible = data["version_numb"] <= version_numb
	$content/new_update_alert/version.text = data["version_name"]
	$content/new_update_alert/current_version/current_version.text = PDS.version
	download_link = data["version_download_link"]
	
	if data["version_numb"] <= version_numb:
		$content/title.text = "No updates ):"
	
	$HTTPRequestImage.request(data["version_cover"])


func _on_http_request_image_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var img = Image.new()
	img.load_webp_from_buffer(body)
	
	var tex = ImageTexture.new()
	tex.set_image(img)
	
	$content/new_update_alert/version_cover.texture = tex


func _on_download_pressed() -> void:
	OS.shell_open(download_link)


func _on_exit_pressed() -> void:
	$".".visible = false
