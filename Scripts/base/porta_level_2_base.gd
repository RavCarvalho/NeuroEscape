extends Node2D

@onready var img_atual : Sprite2D = get_node("ImgInstance")
@onready var player_text : RichTextLabel = get_node("PlayerText/text")
@onready var _timer : Timer = get_node("PlayerText/Timer")

var count_door_click = 0 ## para fins de testes e simulação também 

var frases : Array = ["","[center]Preciso de uma chave para abrir","[center]Me perguntava porque isso estava aqui. Parece que é para emergências.",
"[center]Algém deixou cair no início do protocolo. Parece uma página de um documento.", "[center]Tinha uma chave aí.",
"[center]Parece que abriu!", "[center]A senha não é essa.", "[center]Que bom que deixei a chave na tranca.", "[center]Está vazio agora. Talvez algum funcionário antigo tenha deixado aqui."]
enum iten {empty, door, box, paper, key, open_box, wrong_pw, back_to_door, back_to_box}

func _ready() -> void:
	Global.send_status_pw.connect(open_box)

func _process(delta: float) -> void:
	pass
	#open_box()


func _on_left_pressed() -> void:
	MusicManager.playSFX("clickbotao")
	if img_atual.texture == null:
		get_tree().change_scene_to_file("res://Scenes/level_2_escada.tscn")
	else:
		back()

func _on_paper_button_down() -> void:
	MusicManager.playSFX("papel")
	hide_signals()
	update_palyer_text(iten.paper,3)
	img_atual.texture = preload("res://Assets/level2/papel aberto.png")
	$AditionalItens/paper.visible = true
	show_add_iten($AditionalItens/paper)


func _on_box_button_down() -> void:
	if Global.pass_scene == true:
		update_palyer_text(iten.back_to_box, 3.5)
		$BackScenario/Bau.play("open")
		print("estou verdadeira sim: ", Global.pass_scene)
	if Global.senha_correta == true and Global.pass_scene == false:
		update_palyer_text(iten.key, 2)
		Inventory.add_item(load("res://Assets/level2/chave.png"))
		$Signals/box.disabled
	if Global.senha_correta == false and Global.pass_scene == false:
		hide_signals()
		update_palyer_text(iten.box,3.5)
		img_atual.texture = preload("res://Assets/level2/senha bau.png")
		show_add_iten($AditionalItens/box)

func _on_door_button_down() -> void:
	if Global.pass_scene == true:
		update_palyer_text(iten.back_to_door, 2)
		print("Voltei à cena")
		$AditionalItens/door/Cadeado.texture = preload("res://Assets/level2/cadeado aberto.png")
	if Inventory.items.has(load("res://Assets/level2/chave.png")): #se tem chave no inventário
		$AditionalItens/door/Cadeado.texture = preload("res://Assets/level2/cadeado aberto.png")
	else:
		update_palyer_text(iten.door,2)
	hide_signals()
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

#@TODO dar um jeito de colocar esses textos obs: apagar print_box_txt
func open_box():
	print("SINAL CHEGOOOOOUUU")
	if Global.senha_correta == true:
		MusicManager.playSFX("portadestrancada")
		$BackScenario/Bau.play("open")
		update_palyer_text(iten.open_box, 2)
		back()
	else: 
		MusicManager.playSFX("error")
		update_palyer_text(iten.wrong_pw, 2)


func _on_door_pressed() -> void:
	if Inventory.items.has(load("res://Assets/level2/chave.png")): #se tem chave no inventário
		Save.save_game()
		MusicManager.playSFX("portadestrancada")
		get_tree().change_scene_to_file("res://Scenes/base/Escadaria.tscn")
		Global.senha_correta = false
		Inventory.remove_item(load("res://Assets/level2/chave.png")) #remove chave do inventário
