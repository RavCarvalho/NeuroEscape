extends Node2D
var count_click =0
enum interactve_with { empty, l_drawer, door, estante, window, coffee}
var frases : Array = ["", "[center]Estão trancadas", "[center]Perdi o acesso com meu crachá. Preciso da senha do administrador para abrir.", 
"[center]Alguns livros e troféus da empresa. Eles são bem renomados.", "[center]O clima está agradável lá fora, diferente daqui...",
 "[center]Está vazia. O chefe proibiu café na empresa..."]
#@TODO colocar gaveta em outra cena
@onready var _timer = get_node("PlayerText/Timer")
@onready var player_text = get_node("PlayerText/text")
@onready var _back : Sprite2D= get_node("OfficeLevel1")
var back_sprite : Array = ["res://Assets/level1/office_level1.png", "res://Assets/level1/book_zoom.png","res://Assets/level1/book_w_paper.png" ]
func _ready() -> void:
	
	
	player_text.text = frases[interactve_with.empty]


func _process(delta: float) -> void:
	pass
	#ajust_text_size()

#Isso era pra ajustar o tamanho da fonte dentro do quadro de texto, não está funcionando ainda
func ajust_text_size():
	pass
	#player_text.normal_font_size = 45
	#while player_text.get_minimum_size().y > 100 and player_text.normal_font_size > 20:
		#player_text.normal_font_size -= 1

#Colocar texto em certa duração de acordo com o iten interagido
func interactive_iten_text(event, id, time):
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			player_text.text = frases[id]
			_timer.start(time)



func _on_left_drawer_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interactive_iten_text(event, interactve_with.l_drawer, 2)



func _on_door_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#Sair se sennha estiver  correta
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if Global.senha_correta == false:
				player_text.text = frases[interactve_with.door]
				_timer.start(3)
			else: 
				Save.save_game()
				get_tree().change_scene_to_file("res://Scenes/level_2_escada.tscn");
				MusicManager.playSFX("portadestrancada")
				Global.senha_correta = false


func _on_estante_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interactive_iten_text(event, interactve_with.estante, 3)


func _on_window_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interactive_iten_text(event, interactve_with.window, 4)


func _on_coffee_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interactive_iten_text(event, interactve_with.coffee, 3)

#Muda para gaveta em zoom
func _on_right_drawer_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			get_tree().change_scene_to_file("res://Scenes/base/drawer_level_1.tscn")

#Muda prar imagem da tranca para colocar a senha
func _on_door_tranca_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			
			get_tree().change_scene_to_file("res://Scenes/base/tranca_level_1.tscn")



func _on_book_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			for i in $InteractiveAreas.get_children():
				i.visible = false
			_back.texture = preload("res://Assets/level1/book_zoom.png")
			$ItensBook/book.visible = true #disable colocar
			#for i in _@TODO fazer um for aqui


func _on_book_pressed() -> void:
	count_click += 1
	print(count_click)
	if count_click == 1:
		_back.texture = preload("res://Assets/level1/book_w_paper.png")
	if count_click == 2:
		#@TODO tem erro aq resolver
		count_click = 0
		back()

func back():
	for i in $InteractiveAreas.get_children():
		i.visible = true
	_back.texture = preload("res://Assets/level1/office_level1.png")
	$ItensBook/book.visible = false
	


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			back()
