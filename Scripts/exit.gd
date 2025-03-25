extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_up() -> void:

	get_tree().change_scene_to_file("res://Scenes/base/Escadaria.tscn")


func _on_door_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if Inventory.items.has(load("res://Assets/Cofre/chave cofre.png")):
				get_tree().change_scene_to_file("res://Scenes/cut_scene_4.tscn")
			else:
				get_node("PlayerText/text").text = "´[center] Está trancado. Preciso sair daqui!"
				get_node("PlayerText/Timer").start(2.5)
