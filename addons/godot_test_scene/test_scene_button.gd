@tool
extends Button

const META_NAME := "test_scene"

func _on_pressed() -> void:
	var current_scene := EditorInterface.get_edited_scene_root()
	if current_scene.has_meta(META_NAME):
		run_test_scene()
	else:
		show_selection_window("Select test scene path")

func run_test_scene():
	var current_scene := EditorInterface.get_edited_scene_root()
	var test_scene_path := current_scene.get_meta(META_NAME)
	if ResourceLoader.exists(test_scene_path):
		EditorInterface.play_custom_scene(test_scene_path)
	else:
		current_scene.remove_meta(META_NAME)
		show_selection_window("No scene exists at saved path, select new path")

func show_selection_window(message:String):
	var file_dialog := FileDialog.new()
	file_dialog.mode_overrides_title = true
	file_dialog.title = message
	file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	file_dialog.filters = ["*.tscn","*.scn"]
	file_dialog.connect("file_selected", set_test_scene_path)
	EditorInterface.popup_dialog_centered(file_dialog, Vector2i(300, 400))

func set_test_scene_path(path:String):
	var current_scene := EditorInterface.get_edited_scene_root()
	current_scene.set_meta(META_NAME, path)
	run_test_scene()
