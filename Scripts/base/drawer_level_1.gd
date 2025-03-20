extends Node2D


@onready var files_node : Sprite2D = get_node("files")
@onready var player_text = get_node("PlayerText/text")

var click_count = 0

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func uptade_text(txt, time):
	player_text.text = txt
	get_node("PlayerText/Timer").start(time)

func _on_file_button_button_down() -> void:
	click_count +=1
	#@TODO transformar isso em um for
	# for i in range assts.leght(): files.node == preload(i); click_count += 1
	if click_count == 1:
		$DrawerBack.texture = preload("res://Assets/level1/drawer_open.png")
		MusicManager.playSFX("gaveta")
	if click_count == 2:
		files_node.texture = preload("res://Assets/level1/file_closed.png")
	if click_count == 3:
		files_node.texture = null
		$other_file.texture = preload("res://Assets/level1/file_photo.png")
	if click_count == 4:
		$other_file.texture = preload("res://Assets/level1/file_info.png")
		uptade_text("[center]'26/01/1972 Inauguração NeuroCorp: tudo pronto pra sua chegada.' É uma foto desse dia.", 4)
	if click_count >= 5:
		$other_file.texture = null
		##Other file foi criado pra sanar os erros de formatação de imagem de quem colocou. Pf, pare de errar o tamnaho da imagem :(
		$DrawerBack.texture = preload("res://Assets/level1/drawe_closed.png")
		click_count = 0
	if click_count != 3 and click_count != 4:
		$menssage.visible = false
	else: $menssage.visible = true


func _on_out_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			get_tree().change_scene_to_file("res://Scenes/level_1_office.tscn")
