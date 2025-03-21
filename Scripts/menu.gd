extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.playMusic("calma")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_text_backspace"):
		Save.save_game()
		
	
		



func _on_button_button_up() -> void:
	MusicManager.playSFX("email")
	$email.visible = true


func _on_sair_button_up() -> void:
	MusicManager.playSFX("clickbotao")
	get_tree().quit()  # Fecha o aplicativo


func _on_aceitar_pressed() -> void:
	MusicManager.playSFX("clickbotao")
	get_tree().change_scene_to_file("res://Scenes/cut_scene_1.tscn")

func _on_fechar_email_button_up() -> void:
	MusicManager.playSFX("email")
	$email.visible = false


func _on_tutorial_button_up() -> void:
	MusicManager.playSFX("clickbotao")
	$tutorial2.visible = true


func _on_fechartutorial_button_up() -> void:
	MusicManager.playSFX("clickbotao")
	$tutorial2.visible = false


func _on_load_button_up() -> void:
	MusicManager.playSFX("clickbotao")
	Save.load_game()
	#Save.load_inventory()
	
