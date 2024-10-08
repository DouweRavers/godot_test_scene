class_name LinkData extends RefCounted

var links:Dictionary

func _init() -> void:
	load_scene_links()

func has_link(original_scene:String)->bool: return links.keys().has(original_scene)

func get_link(original_scene:String)->String: return links[original_scene] as String

func save_scene_link(original_scene:String, target_scene:String):
	links[original_scene] = target_scene
	var file = FileAccess.open("res://addons/godot_scene_reroute/links.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(links))
	file.close()

func load_scene_links():
	var file = FileAccess.open("res://addons/godot_scene_reroute/links.json", FileAccess.READ)
	links = JSON.parse_string(file.get_as_text())
	file.close()
