@tool
extends EditorPlugin

func _enter_tree() -> void:
	add_play_test_scene_button()

func _exit_tree() -> void:
	remove_test_play_button()

func add_play_test_scene_button()->void:
	var play_current_button := search_play_current_button(EditorInterface.get_base_control())
	var play_test_button_scene := load("res://addons/godot_test_scene/test_scene_button.tscn") as PackedScene
	play_current_button.add_sibling(play_test_button_scene.instantiate())

func remove_test_play_button()->void:
	var button := search_play_test_button(EditorInterface.get_base_control())
	button.queue_free()

func search_play_current_button(node:Node)->Button:
	if node is Button and (node as Button).tooltip_text == "Play the edited scene.":
		return (node as Button)
	for child in node.get_children():
		var button := search_play_current_button(child)
		if button is Button:
			return button as Button
	return null

func search_play_test_button(node:Node)->TestSceneButton:
	if node is TestSceneButton:
		return (node as Button)
	for child in node.get_children():
		var button := search_play_current_button(child)
		if button is TestSceneButton:
			return button as TestSceneButton
	return null
