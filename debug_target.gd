class_name DebugTarget extends Node

func _enter_tree() -> void:
	var node = get_tree().current_scene
	node.get_parent().remove_child(node)
	replace_by(node)
	queue_free()
