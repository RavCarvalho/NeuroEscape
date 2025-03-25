extends Node2D

var safe_pw = ["alien", "ALIEN"]

var click = 0
@onready var text_node = get_node("AddItens/ClosedSafe/TextEdit")
@onready var player_text = get_node("PlayerText/text")
@onready var _timer = get_node("PlayerText/Timer")
@onready var _timer_to_finish: Timer = get_node("TimeToFinish/Timer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.skip_cutscene = true
	#Global.finishpuzzle.connect(abrircaixa)
	_timer_to_finish.start(302)
	#show_itens($ItensAdd/CofreFechado)

func show_itens(iten_node):
	iten_node.visible = true

func hide_itens(iten_node):
	iten_node.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	zeratime()
	##Verifica o estado da senha
	if Input.is_action_just_pressed("entrar"): 
		if Global.senha_correta:
			pass
		if  !Global.senha_correta and safe_pw.has(text_node.text):
			update_txt("[center]Abriu!!", 2)
			Global.senha_correta = true
			MusicManager.playSFX("chefealien")
			
		if !Global.senha_correta and !safe_pw.has(text_node.text):
			update_txt("[center]Senha incorreta.", 2)
			
		text_node.text = ""
	
	if Global.puzzleterminado:
		hide_itens($Puzzle)
		get_node("BoxSprite").texture = preload("res://Assets/Cofre/caixaaberta.png")
		show_itens($AddItens/openBox)
		Global.puzzleterminado = false

##Limita o texto do textline pra 5 caracteres
func _on_text_edit_lines_edited_from(from_line: int, to_line: int) -> void:
	if text_node.text.length() > 5:
		text_node.text = text_node.text.left(5)

##Atualiza texto do jogaor
func update_txt (text: String, time):
	player_text.text = text
	_timer.start(time)

##Abre cofre se senha for correta
#func _on_safearea_pressed() -> void:
	#if Global.senha_correta:
		#get_node("CofreSprite").texture = preload("res://Assets/Cofre/cofre aberto.png")

	
	
#func abrircaixa() -> void:
	##print("recebi sinaal")
	#$Puzzle.visible = false
	#$"cofre aberto/caixafechada".visible = false
	#$"cofre aberto/caixaaberta".visible = true
#
#
#func _on_irescadaria_button_up() -> void:
	#get_tree().change_scene_to_file("res://Scenes/base/Escadaria.tscn")
#
#
#func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#pass # Replace with function body.
#
#
#func _on_irescadaria_pressed() -> void:
	#get_tree().change_scene_to_file("res://Scenes/base/Escadaria.tscn")


#func _on_key_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if event is InputEventMouseButton  and event.pressed:
		#if event.button_index == MOUSE_BUTTON_LEFT:
			#Inventory.add_item(load("res://Assets/Cofre/chave cofre.png"))
			#print("Chave 2 add no inventário")



#func _on_alfabeto_button_up() -> void:
	##$Cofre/Alfabeto.visible =
	#click += 1
	#if click == 1:
		#$Cofre/Alfabeto.visible = true
	#if click >= 2:
		#$Cofre/Alfabeto.visible = false
		#click = 0


func _on_open_cofre_pressed() -> void:
	if Global.senha_correta:
		get_node("SafeSprite").texture = preload("res://Assets/Cofre/cofre aberto.png")
		get_node("BoxSprite").texture = preload("res://Assets/Cofre/caixafechada.png")
		hide_itens($AddItens/ClosedSafe)
		show_itens($AddItens/OpenSafe)
	else:
		update_txt("[center]Tenho que colocar a senha para abrir", 2.5)


func _on_box_button_pressed() -> void:
	show_itens($Puzzle)





func _on_key_area_pressed() -> void:
	Inventory.add_item(load("res://Assets/Cofre/chave cofre.png"))
	hide_itens($AddItens/openBox)


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/base/Escadaria.tscn")
	
func zeratime() -> void:
	if Input.is_action_just_pressed("T"):
		#print("tempo zerado")
		#_timer_to_finish.wait_time = 1;
		#print(_timer_to_finish.wait_time);
		_timer_to_finish.emit_signal("timeout");

		


func _on_alfabeto_button_up() -> void:
	click += 1
	if click == 1:
		$Alfabeto.visible = true
	if click >= 2:
		$Alfabeto.visible = false
		click = 0
