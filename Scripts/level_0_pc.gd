extends Node2D
@onready var email_button = get_node("EmailButton")
@onready var player_text = get_node("PlayerText")
@onready var timer_node = get_node("TimertoText")
@onready var timer_pass = get_node("TimerToChange")

#@TODO tornar timertotext global
var frases : Array = ["[center]Como o tempo voa!", "[center]Trouxe de casa. Ela não parece bem aqui."]

func _ready() -> void:
	player_text.text = " "
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(timer_pass.time_left)
	if timer_pass.time_left == 3:
		print("faltam 3")
		$AnimLight.play("ligtht_")


func _on_email_button_button_up() -> void:
	if $messaege.visible == false:
		$messaege.visible = true
		timer_pass.start(8)
	else: $messaege.visible =false


func _on_regio_light_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT and $light.visible == false:  # Verifica se foi o botão esquerdo
			$light.visible = true
			print("Clicou dentro da Area2D!")
		else: $light.visible = false
#@TODO mudar op modo de er a luz e padronizar para todas as áreas


func _on_region_clock_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interactive_with_text(event, 0, 2)


func _on_regio_plant_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	interactive_with_text(event, 1, 4)

func interactive_with_text(event, id, time):
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			player_text.text = frases[id]
			timer_node.start(time)
			


func _on_timerto_text_timeout() -> void:
	player_text.text = " "


func _on_timer_to_change_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_1_office.tscn")
	#@TODO mudar para cena 2 inves de level1
