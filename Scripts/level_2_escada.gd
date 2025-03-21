extends Node2D
@onready var player_text : RichTextLabel = get_node("PlayerText/text")
@onready var _timer = get_node("PlayerText/Timer")
var frases : = ["[center]Os elevadores pararam de funcionar, estamos presos nesse prédio.", "[center]Os escritórios estão trancados. Tem alguém lá dentro?",
"[center]'Cuide bem das plantas'. É um lembrete."]
enum item {elevador, portas, lembrete}
var click_count = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Save.save_game()
	pass

#
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#@TODO fazer uma cena de player text global de modo que sobreponha todo o cenário
func interaction_text(event, id, time):
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			player_text.text = frases[id]
			_timer.start(time)



func _on_regiaoelevador_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if click_count == 1:
		interaction_text(event, item.lembrete, 3)
	else: interaction_text(event, item.elevador, 3)


func _on_portas_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interaction_text(event, item.portas, 3)


func _on_prancheta_pressed() -> void:
	click_count+= 1
	if click_count == 1:
		MusicManager.playSFX("papel")
		$Prancheta.texture = preload("res://Assets/level2/prancheta de aviso.png")
		$"info-prancheta".text = "Lembrete aos funcionários:
			 Cuidem bem das plantas!

	 NeuroCorp E>"
	if click_count >= 2:
		$Prancheta.texture = null
		$"info-prancheta".text = ""
		click_count = 0


func _on_setadireita_button_up() -> void:
	MusicManager.playSFX("clickbotao")
	Save.save_game()
	get_tree().change_scene_to_file("res://Scenes/base/porta_level_2_base.tscn")
