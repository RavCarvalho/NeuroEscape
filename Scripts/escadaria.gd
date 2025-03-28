extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Save.save_game()
	Global.pass_scene = true



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_paracima_button_up() -> void:
	#troca a cena para a cutscene
	if !Global.skip_cutscene:
		get_tree().change_scene_to_file("res://Scenes/cut_scene_3.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/cofre.tscn")


func _on_parabaixo_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/exit.tscn")


func _on_back_2_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/base/porta_level_2_base.tscn")
