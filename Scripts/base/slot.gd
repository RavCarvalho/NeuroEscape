class_name Slot extends Control

@export var sprite : Texture:
	set(value):
		sprite = value
		get_node("Sprite").texture = sprite





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
