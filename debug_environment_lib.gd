class_name DebugEnvironmentLib extends Object

const debug_environment_path = "res://editor/debug_environments/debug_env_$SCENE$"

static func get_debug_path(node:Node) -> String:
	return debug_environment_path.replace("$SCENE$", node.scene_file_path.get_file())
