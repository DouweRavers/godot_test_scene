#include <godot_cpp/variant/string.hpp>
#include <godot_cpp/classes/packed_scene.hpp>
#include <godot_cpp/classes/editor_interface.hpp>
#include <godot_cpp/classes/resource_loader.hpp>

#include "run_test_scene_button.hpp"

using namespace godot;

void TestSceneButton::pressed()
{
	Node* current_scene = EditorInterface::get_singleton()->get_edited_scene_root();
	if(current_scene->has_meta("test_scene")) run_test_scene(current_scene);
	else create_or_select_test_scene(current_scene);
}

void TestSceneButton::run_test_scene(Node* current_scene)
{
	Ref<PackedScene> test_scene_resource = current_scene->get_meta("test_scene");
	String test_scene_path = test_scene_resource->get_path();
	EditorInterface::get_singleton()->play_custom_scene(test_scene_path);
}

void TestSceneButton::create_or_select_test_scene(Node* current_scene)
{
	
}

