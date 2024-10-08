@tool
class_name SceneReroutePlugin extends EditorPlugin

static var instance:SceneReroutePlugin

var inspector:SceneRerouteInspector

func _enter_tree():
	instance = self
	var inspector_script := load("res://addons/godot_scene_reroute/inspector.gd") as GDScript
	inspector = inspector_script.new()
	add_inspector_plugin(inspector)
	add_autoload_singleton("RerouteWatcher", "res://addons/godot_scene_reroute/watcher.gd")

func _exit_tree():
	remove_inspector_plugin(inspector)
	remove_autoload_singleton("SceneRerouteWatcher")
