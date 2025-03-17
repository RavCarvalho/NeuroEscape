extends Node2D
var inventory = []

# Adiciona item ao inventário
func add_item(item_name: String, quantity: int):
	inventory.append({"name": item_name, "quantity": quantity})

# Retorna o inventário
func get_inventory():
	return inventory

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
