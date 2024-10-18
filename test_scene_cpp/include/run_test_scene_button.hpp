#ifndef TEST_SCENE_BUTTON_H
#define TEST_SCENE_BUTTON_H

#include <godot_cpp/classes/button.hpp>
#include <godot_cpp/variant/string.hpp>

namespace godot {

class TestSceneButton : public Button {
	GDCLASS(TestSceneButton, Button)

private:
	void run_test_scene();
	void show_selection_window(String message);
	void set_test_scene_path(String path);

protected:
	void pressed();
	static void _bind_methods();

public:
	void _ready();

	TestSceneButton(){}
	~TestSceneButton(){}
};

}

#endif