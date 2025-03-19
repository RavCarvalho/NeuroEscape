extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	testEsc()
func pause():
	$".".visible = true
	get_tree().paused = false
	
func continuar():
	get_tree().paused = false
	
	$".".visible = false
	
func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		print("esc")
		pause()
		
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		print("esc")
		continuar()
		


func _on_continuar_button_up() -> void:
	continuar()


func _on_sair_button_up() -> void:
	Save.save_game()
	Save.save_
	get_tree().change_scene_to_file("res://Scenes/credito.tscn")
