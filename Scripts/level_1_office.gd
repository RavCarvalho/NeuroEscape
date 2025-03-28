extends Node2D

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
	Save.save_game()
	

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
			if id == interactve_with.estante:
				MusicManager.playSFX("estante")
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
				Global.unlocked = true
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
			
			$ItensBook.visible = true #disable colocar
			hide_areas()
			_back.texture = preload("res://Assets/level1/book_zoom.png")
			#for i in _@TODO fazer um for aqui

func hide_areas():
	for i in $InteractiveAreas.get_children():
		
		i.visible = false

func _on_book_pressed() -> void:
	MusicManager.playSFX("papel")
	_back.texture = preload("res://Assets/level1/book_w_paper.png")
	$box_text.text = "Estou feliz que as coisas tenham dado certo. Lembro-me que tudo começou no dia na inauguração. Foi, de fato, um dia [b]inesquecível..."
	#if count_click == 2:
		#_back.texture = preload("res://Assets/level1/book_zoom.png")
		#count_click = 0
		
func back():
	for i in $InteractiveAreas.get_children():
		i.visible = true
	_back.texture = preload("res://Assets/level1/office_level1.png")
	$ItensBook.visible = false
	$box_text.text = ""

	


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			back()
