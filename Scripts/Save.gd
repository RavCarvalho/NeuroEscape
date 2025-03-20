extends Node 

## Dicionario para guardar as cenas
var scenesDictio: Dictionary = {
	"Menu" : preload("res://Scenes/Menu.tscn"),
	"Level0_PC" : preload("res://Scenes/level_0_pc.tscn"),
	"Level1_Office" : preload("res://Scenes/level_1_office.tscn"),
	"Level2Eescada" : preload("res://Scenes/level_2_escada.tscn"),
	"Escadaria" : preload("res://Scenes/Escadaria.tscn"),
}



func _ready() -> void:
	pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



# Função para salvar o jogo
func save_game():
	var save_data: Dictionary = {
		"scene": get_tree().get_current_scene().name,  # Guarda o caminho da cena atual
		
		}

	var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data))  # Converte o dicionário em JSON e armazena
		file.close()
		print("jogo salvo com sucesso!")
		print(save_data)

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
