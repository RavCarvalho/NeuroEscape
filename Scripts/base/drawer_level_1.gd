extends Node2D


@onready var files_node : Sprite2D = get_node("files")


var click_count = 0

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



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
		files_node.texture = preload("res://Assets/level1/file_open.png")
	if click_count >= 4:
		files_node.texture = null
		$DrawerBack.texture = preload("res://Assets/level1/drawe_closed.png")
		click_count = 0
	if click_count != 3:
		$menssage.visible = false
	else: $menssage.visible = true


func _on_out_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			get_tree().change_scene_to_file("res://Scenes/level_1_office.tscn")
