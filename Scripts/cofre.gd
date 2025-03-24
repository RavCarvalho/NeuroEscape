extends Node2D

var safe_pw = "alien"
@onready var text_node = get_node("Cofre/TextEdit")
@onready var player_text = get_node("PlayerText/text")
@onready var _timer = get_node("PlayerText/Timer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.finishpuzzle.connect(abrircaixa)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_text.visible = player_text.text != ""
	##Verifica o estado da senha
	if Input.is_action_just_pressed("entrar") : 
		if safe_pw == text_node.text:
			update_txt("[center]Abriu!!", 2)
			Global.senha_correta = true
			
		else:
			update_txt("[center]Senha incorreta.", 2)
			
		text_node.text = ""

func _on_text_edit_lines_edited_from(from_line: int, to_line: int) -> void:
	if text_node.text.length() > 5:
		text_node.text = text_node.text.left(5)

func update_txt (text: String, time):
	player_text.text = text
	_timer.start(time)


func _on_safearea_pressed() -> void:
	if Global.senha_correta:
		get_node("cofre aberto"). visible = true


func _on_texture_button_button_up() -> void:
	$Puzzle.visible = true
	
	
func abrircaixa() -> void:
	print("recebi sinaal")
	$Puzzle.visible = false
	$"cofre aberto/caixafechada".visible = false
	$"cofre aberto/caixaaberta".visible = true


func _on_irescadaria_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/base/Escadaria.tscn")


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.
