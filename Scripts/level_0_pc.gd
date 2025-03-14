extends Node2D
@onready var email_button = get_node("EmailButton")
@onready var player_text = get_node("PlayerText")

var frases : Array = ["frase1", "frase2"]

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_email_button_button_up() -> void:
	if $messaege.visible == false:
		$messaege.visible = true
	else: $messaege.visible =false


func _on_regio_light_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT and $light.visible == false:  # Verifica se foi o botão esquerdo
			$light.visible = true
			print("Clicou dentro da Area2D!")
		else: $light.visible = false
#@TODO mudar op modo de er a luz e padronizar para todas as áreas

func _on_regio_light_mouse_entered() -> void:
	pass
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#print("é ou n")
		#player_text.text = frases[0]
