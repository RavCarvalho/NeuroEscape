class_name SaveManager
extends Node 

## Dicionario para guardar as cenas
var scenesDictio: Dictionary = {
	"Menu" : preload("res://Scenes/Menu.tscn"),
}


func _ready() -> void:
	pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Exemplo de variável de inventário (caso não tenha um singleton)
var player_inventory = []

# Função para salvar o jogo
func save_game():
	var save_data: Dictionary = {
		"scene": get_tree().get_current_scene().name,  # Guarda o caminho da cena atual
		"inventory": get_inventory_data()  # Função para obter os dados do inventário
		}

	var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data))  # Converte o dicionário em JSON e armazena
		file.close()
		print("jogo salvo com sucesso!")
		print(save_data)

# Função para obter os dados do inventário
func get_inventory_data():
	var inventory = []
	for item in player_inventory:
		inventory.append({"item_name": item.name, "quantity": item.quantity})
	print("inventario: ")
	print(inventory)
	return inventory

# Função para carregar o jogo
func load_game():
	var file = FileAccess.open("user://savegame.json", FileAccess.READ)
	if file:
		var json = JSON.new()  # Cria uma instância de JSON
		var result = json.parse(file.get_as_text())  # Faz o parse com a instância

		if result == OK:
			var save_data = json.get_data()  # Obtém os dados do JSON
			file.close()

			# Carregar a cena salva
			var scene_path = save_data["scene"]
			get_tree().change_scene_to_packed(scenesDictio[scene_path])  # Carrega a cena salva

			# Carregar o inventário salvo
			var inventory_data = save_data["inventory"]
			load_inventory(inventory_data)
			
			
## Função para carregar o inventário
func load_inventory(inventory_data: Array):
	player_inventory.clear()  # Limpa o inventário atual
	for data in inventory_data:
		add_item_to_inventory(data["item_name"], data["quantity"])

## Função para adicionar itens ao inventário
func add_item_to_inventory(item_name: String, quantity: int):
	var item = {"name": item_name, "quantity": quantity}
	player_inventory.append(item)
