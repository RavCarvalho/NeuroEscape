extends Node2D

@onready var img_atual : Sprite2D = get_node("ImgInstance")
@onready var player_text : RichTextLabel = get_node("PlayerText/text")
@onready var _timer : Timer = get_node("PlayerText/Timer")


var frases : Array = ["[center]Preciso de uma chave para abrir","[center]Me perguntava porque isso estava aqui. Parece que é para emergências.",
"[center]Algém deixou cair no início do protocolo. Parece uma página de um documento.", "[center]Tinha uma chave aí.",
"[center]Parece que abriu!", "[center]A senha não é essa."]
enum iten {door, box, paper, key, open_box, wrong_pw}

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	open_box()


func _on_left_pressed() -> void:
	if img_atual.texture == null:
		print("vamo q vam0p")
		get_tree().change_scene_to_file("res://Scenes/level_2_escada.tscn")
	else:
		back()

func _on_paper_button_down() -> void:
	hide_signals()
	update_palyer_text(iten.paper,3)
	img_atual.texture = preload("res://Assets/level2/papel aberto.png")
	$AditionalItens/paper.visible = true
	show_add_iten($AditionalItens/paper)


func _on_box_button_down() -> void:
	if Global.senha_correta == true:
		update_palyer_text(iten.key, 2)
		#@TODO Aqui um item será adicionado ao inventário(a chave):
		#colocar senha = false somente quando ele passar pela porta.
		#Global.senha_correta = false
		$Signals/box.disabled
	else:
		hide_signals()
		update_palyer_text(iten.box,3)
		img_atual.texture = preload("res://Assets/level2/senha bau.png")
		show_add_iten($AditionalItens/box)
	#if get_key = true

func _on_door_button_down() -> void:
	hide_signals()
	update_palyer_text(iten.door,2)
	img_atual.texture = preload("res://Assets/level2/zoom porta escada.png")
	show_add_iten($AditionalItens/door)


func show_add_iten(iten):
	iten.visible = true


func hide_signals():
	for i in $Signals.get_children():
		i.visible = false


func back():
	img_atual.texture = null
	for i in $AditionalItens.get_children():
		i.visible = false
	for i in $Signals.get_children():
		i.visible = true

func update_palyer_text(id, time):
	player_text.text = frases[id]
	_timer.start(time)


func open_box():
	if Global.senha_correta == true:
		$BackScenario/Bau.play("open")
		back()
		update_palyer_text(iten.open_box, 2)
	#else: update_palyer_text(iten.wrong_pw, 2)
