extends Node2D

enum interactve_with { empty, l_drawer, door, estante, window, coffee}
var frases : Array = ["", "[center]Estão trancadas", "[center]Perdi o acesso com meu crachá. Preciso da senha do administrador para abrir.", 
"[center]Alguns livros e troféus da empresa. Eles são bem renomados.", "[center]O clima está agradável lá fora, diferente daqui...",
 "[center]Está vazia. O chefe proibiu café na empresa..."]
#@TODO colocar gaveta em outra cena
@onready var timer_txt = get_node("TimerText")
@onready var player_text = get_node("PlayerText")

func _ready() -> void:
	player_text.text = frases[interactve_with.empty]


func _process(delta: float) -> void:
	player_text.visible = player_text.text != ""
	#ajust_text_size()


func ajust_text_size():
	pass
	#player_text.normal_font_size = 45
	#while player_text.get_minimum_size().y > 100 and player_text.normal_font_size > 20:
		#player_text.normal_font_size -= 1

func interactive_iten_text(event, id, time):
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			player_text.text = frases[id]
			timer_txt.start(time)



func _on_right_drawer_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var zoom_drawer = get_node("Drawer_R").visible
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			$Drawer_R.visible = true


func _on_to_open_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT and $Drawer_R/drawer_open.visible == false:
			$Drawer_R/drawer_open.visible = true
		else: $Drawer_R/Files.visible = true
		#Mudar isso aq tudo, tta uma bosta
		if event.button_index == MOUSE_BUTTON_LEFT and $Drawer_R/Files.visible == true:
			$Drawer_R/Files/fileOpen.visible =  true
			$Drawer_R/Files/label.text = "Arq. Confidencial

[center]A Fase 3 foi um sucesso parcial. Os impulsos nervosos responderam ao estímulo, mas a consciência... [i]fragmentou-se. [/i]Precisamos recalibrar a frequência antes da próxima rodada.

[b]Aviso: este documento deve ser destruído após a leitura"


func _on_left_drawer_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interactive_iten_text(event, interactve_with.l_drawer, 2)


func _on_timer_text_timeout() -> void:
	player_text.text = frases[interactve_with.empty]


func _on_door_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interactive_iten_text(event, interactve_with.door, 3)


func _on_estante_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interactive_iten_text(event, interactve_with.estante, 3)


func _on_window_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interactive_iten_text(event, interactve_with.window, 4)


func _on_coffee_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interactive_iten_text(event, interactve_with.coffee, 3)
