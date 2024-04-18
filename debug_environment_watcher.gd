extends Node

func _enter_tree() -> void:
	# Get loaded scene
	var node = get_tree().current_scene
	# Check if debug environment is stored
	var path = DebugEnvironmentLib.get_debug_path(node)
	if not FileAccess.file_exists(path): return
	
	# Load debug environment
	var debug_env = load(path).instantiate()
	# Search for path of inspecting node in environment
	var target = debug_env.find_child("$DEBUG_TARGET$")
	# Remove scene from current tree
	node.get_parent().remove_child.call_deferred(node)
	# Position at target location or as child of environment root
	if target == null: debug_env.add_child(node)
	else: target.replace_by.call_deferred(node)
	# Replace this node by the environment
	replace_by.call_deferred(debug_env)
