@tool
extends EditorPlugin

var play_test_button:TestSceneButton

func _enter_tree() -> void:
	add_play_test_scene_button()

func _exit_tree() -> void:
	play_test_button.queue_free()

func add_play_test_scene_button()->void:
	var play_current_button := search_play_current_button(EditorInterface.get_base_control())
	var play_test_button_scene := load("res://addons/godot_test_scene/test_scene_button.tscn") as PackedScene
	play_test_button = play_test_button_scene.instantiate()
	play_current_button.add_sibling(play_test_button)

func search_play_current_button(node:Node)->Button:
	if node is Button and (node as Button).tooltip_text == "Play the edited scene.":
		return (node as Button)
	for child in node.get_children():
		var button := search_play_current_button(child)
		if button is Button:
			return button as Button
	return null
