@tool
extends EditorInspectorPlugin

func _can_handle(object):
	return object is Node and object == EditorInterface.get_edited_scene_root()

func _parse_begin(object):
	add_custom_control(create_ui(object))

func create_ui(node: Node) -> Control:
	var path = DebugEnvironmentLib.get_debug_path(node)
	var button = Button.new()
	if(FileAccess.file_exists(path)):
		button.text = "Edit debug environment"
		button.pressed.connect(func(): edit_env(path), CONNECT_DEFERRED)
	else:
		button.text = "Create debug environment"
		button.pressed.connect(func(): create_env(path), CONNECT_DEFERRED)
	return button

func edit_env(path: String):
	EditorInterface.open_scene_from_path(path)

func create_env(path: String):
	if !DirAccess.dir_exists_absolute(path.get_base_dir()): 
		DirAccess.make_dir_recursive_absolute(path.get_base_dir())
	var env = Node.new()
	env.name = path.get_file().replace(".tscn", "")
	var target = Node.new()
	target.name = "$DEBUG_TARGET$"
	env.add_child(target)
	target.owner = env
	var scene = PackedScene.new()
	scene.pack(env)
	ResourceSaver.save(scene, path)
	edit_env(path)

