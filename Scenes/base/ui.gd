extends Control

@onready var container: HBoxContainer = $Inventory/Container



func add_new_iten(data: Texture) -> void:
	for slot in container.get_children():
		if slot.sprite == null:
			slot.sprite = data
 


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("inventory"):
		get_node("Inventory").visible = not get_node("Inventory").visible
