extends Node

var items: Array = []  # Array para armazenar os itens

signal item_added(item_texture: Texture)  
signal  item_removed(item_texture : Texture)

##Adiciona um item ao inventário e emite sinal quando isso acontecer
func add_item(item_texture: Texture) -> void:
	items.append(item_texture)
	emit_signal("item_added", item_texture)  # Notifica que um novo item foi adicionado

func remove_item(item_texture : Texture) ->  void:
	emit_signal("item_removed", item_texture)
