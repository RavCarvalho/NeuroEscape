extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Save.save_game()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_paracima_button_up() -> void:
	#troca a cena para a cutscene
	get_tree().change_scene_to_file("res://Scenes/curscene_3.tscn")


func _on_parabaixo_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/exit.tscn")


func _on_back_2_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_2_escada.tscn")
