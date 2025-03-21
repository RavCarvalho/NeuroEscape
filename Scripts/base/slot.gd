@tool
class_name Slot extends Control

@export var sprite : Texture:
	set(value):
		sprite = value
		get_node("Sprite").texture = sprite
