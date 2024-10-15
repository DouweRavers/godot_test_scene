#include <godot_cpp/variant/utility_functions.hpp>
#include <godot_cpp/classes/packed_scene.hpp>
#include <godot_cpp/classes/editor_interface.hpp>
#include <godot_cpp/classes/resource_loader.hpp>
#include <godot_cpp/classes/file_dialog.hpp>

#include "run_test_scene_button.hpp"

#define META_NAME "test_scene"

using namespace godot;

void TestSceneButton::_bind_methods(){
	ClassDB::bind_method(D_METHOD("pressed"), &TestSceneButton::pressed);
	ClassDB::bind_method(D_METHOD("set_test_scene_path"), &TestSceneButton::set_test_scene_path);
}

void TestSceneButton::_ready(){
	connect("pressed", {this, "pressed"});
}


void TestSceneButton::pressed()
{	
	Node* current_scene = EditorInterface::get_singleton()->get_edited_scene_root();
	if(current_scene->has_meta(META_NAME)) {
		run_test_scene();
	} else {
		show_selection_window("Select test scene path");
	}
}

void TestSceneButton::run_test_scene()
{
	Node* current_scene = EditorInterface::get_singleton()->get_edited_scene_root();
	String test_scene_path = current_scene->get_meta(META_NAME);
	if(ResourceLoader::get_singleton()->exists(test_scene_path)){
		EditorInterface::get_singleton()->play_custom_scene(test_scene_path);
	} else {
		current_scene->remove_meta(META_NAME);
		show_selection_window("No scene exists at saved path, select new path");
	}
}

void TestSceneButton::show_selection_window(String message)
{
	FileDialog *fileDialog = memnew(FileDialog);
	fileDialog->set_mode_overrides_title(false);
	fileDialog->set_title(message);
	fileDialog->set_file_mode(FileDialog::FILE_MODE_OPEN_FILE);
	fileDialog->set_filters({"*.tscn", "*.scn"});
	fileDialog->connect("file_selected", {this, "set_test_scene_path"});
	EditorInterface::get_singleton()->popup_dialog_centered(fileDialog, Vector2i(300, 400));
}

void godot::TestSceneButton::set_test_scene_path(String path)
{
	Node* current_scene = EditorInterface::get_singleton()->get_edited_scene_root();
	current_scene->set_meta(META_NAME, path);
	run_test_scene();
}
