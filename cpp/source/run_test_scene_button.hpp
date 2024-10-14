#ifndef TEST_SCENE_BUTTON_H
#define TEST_SCENE_BUTTON_H

#include <godot_cpp/classes/button.hpp>

namespace godot {

class TestSceneButton : public Button {
	GDCLASS(TestSceneButton, Button)

private:
	void run_test_scene(Node* current_scene);
	void create_or_select_test_scene(Node* current_scene);

protected:
	void pressed();
	static void _bind_methods(){}

public:
	TestSceneButton(){}
	~TestSceneButton(){}
};

}

#endif