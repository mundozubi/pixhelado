extends Control

func read_preferences():
	var recall_choice = PDS.preferences["image_saving"]["recall_choice"]
	if recall_choice:
		$ExportType / OptionButton.selected = PDS.preferences["image_saving"]["export_format_option"]

	$RecallMyChoice / recall / active.visible = recall_choice
