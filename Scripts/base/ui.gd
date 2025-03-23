extends Control

@onready var container: HBoxContainer = $Inventory/Container

##Adiciona um item
#@TODO Verificar se o item já exixte, se n existir, add
func _on_iten_added(data: Texture) -> void:
	show_inventory_for_while()
	for slot in container.get_children():
	 #verifica se o slot está vazio e se o item já existe no inventário
		if slot.sprite == data:
			break
		if slot.sprite == null and slot.sprite !=  data: 
			slot.sprite = data
			break
 
##para aparecer inventário na tela
func _process(delta: float) -> void:
#@TODO o inventario some apos um tempo quanso tem um item no slot. Arrumar isso ai
	if Input.is_action_just_pressed("inventory"):
		get_node("Inventory").visible = not get_node("Inventory").visible


func _ready() -> void:
	Inventory.item_added.connect(_on_iten_added)
	
func show_inventory_for_while():
	print("CHAMEI ISSO AQUI MANOUUU")
	get_node("Inventory").visible = true
	$Timer.start(1.8)

func _on_timer_timeout() -> void:
	get_node("Inventory").visible = false
