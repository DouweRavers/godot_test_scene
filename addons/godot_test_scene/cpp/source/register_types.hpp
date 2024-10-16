#ifndef TEST_SCENE_REGISTER_TYPES_H
#define TEST_SCENE_REGISTER_TYPES_H

#include <godot_cpp/core/class_db.hpp>

using namespace godot;

void initialize_test_scene_module(ModuleInitializationLevel p_level);
void uninitialize_test_scene_module(ModuleInitializationLevel p_level);

#endif // TEST_SCENE_REGISTER_TYPES_H