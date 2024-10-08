extends Node

func _ready() -> void:
	var scene := get_tree().current_scene
	var data := LinkData.new()
	if not data.has_link(scene.scene_file_path): return
	var new_scene_path := data.get_link(scene.scene_file_path)
	get_tree().call_deferred("change_scene_to_file",new_scene_path)
