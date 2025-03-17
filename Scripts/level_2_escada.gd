extends Node2D
@onready var player_text : RichTextLabel = get_node("PlayerText")
var frases : = ["[center]Os elevadores pararam de funcionar, estamos presos nesse prédio.", "[center]Os escritórios estão trancados. Tem alguém lá dentro?",
"[center]'Cuide bem das plantas'. É um lembrete."]
enum item {elevador, portas, lembrete}
var click_count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_text.text = ""

#
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_text.visible = player_text.text != ""

#@TODO fazer uma cena de player text global de modo que sobreponha todo o cenário
func interaction_text(event, id, time):
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			player_text.text = frases[id]
			$TimerTxt.start(time)
	

#func _on_prancheta_button_up() -> void:
	#$aviso.visible = true
#
#
#func _on_voltar_elevador_button_up() -> void:
	#$aviso.visible = false
#
#
#func _on_setadireita_button_up() -> void:
	#if $aviso.visible == false:
		#$"porta escada".visible = true # Replace with function body.
		#$elevador.visible = false




#func _on_setaesquerda_button_up() -> void:
	#if $curiosidade.visible == false:
		#$"porta escada".visible = false # Replace with function body.
		#$elevador.visible = true
	#
	#
#
#
#func _on_papel_curiosidade_button_up() -> void:
	#$curiosidade.visible = true
#
#
#func _on_texture_button_button_up() -> void:
	#$curiosidade.visible = false # Replace with function body.
#
#
#func _on_bau_button_up() -> void:
	#$"porta escada".visible = false
	#$senha.visible = true
#
#
#func _on_fecharsenha_button_up() -> void:
	#$"porta escada".visible = true
	#$senha.visible = false
#
#
#func _on_cadeado_button_up() -> void:
	#$"zoom da porta".visible = true
#
#
#func _on_fechar_zoom_da_porta_button_up() -> void:
	#$"zoom da porta".visible = false


func _on_timer_txt_timeout() -> void:
	player_text.text = ""


func _on_regiaoelevador_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if click_count == 1:
		interaction_text(event, item.lembrete, 3)
	else: interaction_text(event, item.elevador, 3)


func _on_portas_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interaction_text(event, item.portas, 3)


func _on_prancheta_pressed() -> void:
	click_count+= 1
	if click_count == 1:
		$Prancheta.texture = preload("res://Assets/level2/prancheta de aviso.png")
		$"info-prancheta".text = "Lembrete aos funcionários:
			 Cuidem bem das plantas!

	 NeuroCorp E>"
	if click_count >= 2:
		$Prancheta.texture = null
		$"info-prancheta".text = ""
		click_count = 0
