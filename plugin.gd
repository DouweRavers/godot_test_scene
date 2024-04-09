@tool
extends EditorPlugin

var plugin

func _enter_tree():
	plugin = preload("res://addons/douwco.debug_environments/debug_environment_editor_inspector.gd").new()
	add_autoload_singleton("DebugEnvironmentWatcher", "res://addons/douwco.debug_environments/debug_environment_watcher.gd")
	add_inspector_plugin(plugin)

func _exit_tree():
	remove_autoload_singleton("DebugEnvironmentWatcher")
	remove_inspector_plugin(plugin)
