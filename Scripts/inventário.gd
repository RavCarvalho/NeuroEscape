extends TextureRect
var inventory = []

# Adiciona item ao inventário
func add_item(item_name: ):
	inventory.append({"Cracha": $Cracha, "alfabeto":$Alfabeto, "chave": $Chave })

# Retorna o inventário
func get_inventory():
	return inventory

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
