extends Node2D

var senha_tranca = "1972"
#@TODO: quando pegar o commit colocar var senha correta = true/false pra saber se passa pra proxima cena
@onready var text_node : TextEdit = get_node("TextEdit")
@onready var player_text : RichTextLabel = get_node("PlayerText/text")
var frases : Array = ["[center]Senha incorreta.", "[center]Abriu!! Era isso?!", "[center]Agora tá fácil!"]
enum estado{errado, correto, again}
var txt_filtrado = ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("entrar") : 
		if senha_tranca == text_node.text:
			Global.senha_correta = true # é teste -> barulho de tranca abrindo colocar
			if Global.unlocked == false:
				estado_tranca(estado.correto, 2.5, "beep")
			else: estado_tranca(estado.again, 2.5, "beep")
			
		else: estado_tranca(estado.errado, 2, "error")
	
		text_node.text = ""

func estado_tranca(answer, time, music):
	player_text.text = frases[answer]
	$TimerTxt.start(time)
	MusicManager.playSFX(music)



func _on_text_edit_lines_edited_from(from_line: int, to_line: int) -> void:

	if text_node.text.length() > 4:
		text_node.text = text_node.text.left(4)



func _on_voltar_button_up() -> void:
	#K@TODO colocar um asste de seta escura e com pressed
	get_tree().change_scene_to_file("res://Scenes/level_1_office.tscn")


func _on_timer_txt_timeout() -> void:
	player_text.text = ""
	if Global.senha_correta == true:
#		@TODO não deixar mais entrar nessa cena se senha (quando for global) estiver correta
		get_tree().change_scene_to_file("res://Scenes/level_1_office.tscn")
