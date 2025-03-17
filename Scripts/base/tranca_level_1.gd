extends Node2D

var senha_tranca = "1972"
#@TODO: quando pegar o commit colocar var senha correta = true/false pra saber se passa pra proxima cena
var senha_correta = false
@onready var text_node : TextEdit = get_node("TextEdit")
@onready var player_text : RichTextLabel = get_node("textPlayer")
var frases : Array = ["[center]Senha incorreta.", "[center]Abriu!! Era só isso?!"]
enum estado{errado, correto}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_text.visible = player_text.text != ""
	
	if Input.is_action_just_pressed("entrar") : 
		if senha_tranca == text_node.text:
			estado_tranca(estado.correto, 3)
			senha_correta = true #isso vai sair mna, é teste -> barulho de tranca abrindo colocar
		else: estado_tranca(estado.errado, 2)
		text_node.text = ""

func estado_tranca(answer, time):
	player_text.text = frases[answer]
	$TimerTxt.start(time)



func _on_text_edit_lines_edited_from(from_line: int, to_line: int) -> void:
	#text_node.text_changed.disconnect(_on_text_edit_lines_edited_from)
	#var txt_filtrado = ""
	#for char in text_node.text:
		#if char.is_valid_int():
			#text_node.text += char
	if text_node.text.length() > 4:
		text_node.text = text_node.text.left(4)
	#text_node.text = txt_filtrado
	#text_node.text_changed.connect(_on_text_edit_lines_edited_from)


func _on_voltar_button_up() -> void:
	#K@TODO colocar um asste de seta escura e com pressed
	get_tree().change_scene_to_file("res://Scenes/level_1_office.tscn")


func _on_timer_txt_timeout() -> void:
	player_text.text = ""
	if senha_correta == true:
#		@TODO não deixar mais entrar nessa cena se senha (quando for global) estiver correta
		get_tree().change_scene_to_file("res://Scenes/level_1_office.tscn")
