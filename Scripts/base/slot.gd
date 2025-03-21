@tool
class_name Slot extends Control

@export var sprite : Texture:
	set(value):
		sprite = value
		if is_inside_tree():
			get_node("Sprite").texture = sprite
