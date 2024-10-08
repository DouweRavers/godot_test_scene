@tool
class_name SceneRerouteInspector extends EditorInspectorPlugin

var current_scene:Node

func _can_handle(object:Object)->bool:
	return object is Node and object == EditorInterface.get_edited_scene_root()

func _parse_begin(object:Object)->void:
	current_scene = object as Node
	add_custom_control(create_ui(object as Node))

func create_ui(object:Node)->Control:
	var root := VBoxContainer.new()
	var header : = HBoxContainer.new()
	root.add_child(header)
	var icon := TextureRect.new()
	header.add_child(icon)
	icon.texture = load("res://addons/godot_scene_reroute/flask.svg") as Texture2D
	var title := Label.new()
	header.add_child(title)
	title.size_flags_vertical = Control.SIZE_EXPAND_FILL
	title.text = "Select testing scene"
	var scene_picker := EditorResourcePicker.new()
	root.add_child(scene_picker)
	scene_picker.base_type = "PackedScene"
	var data := LinkData.new()
	if data.has_link(current_scene.scene_file_path):
		var scene_path := data.get_link(current_scene.scene_file_path)
		scene_picker.edited_resource = ResourceLoader.load(scene_path)
	scene_picker.connect("resource_changed",on_scene_selected)
	return root

func on_scene_selected(resource:Resource)->void:
	var current_scene_path := current_scene.scene_file_path
	var target_scene_path := resource.resource_path
	var data := LinkData.new()
	data.save_scene_link(current_scene_path, target_scene_path)
