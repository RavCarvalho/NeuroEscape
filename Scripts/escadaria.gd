extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_paracima_button_up() -> void:
	Save.save_game()
	#troca a cena para a cutscene
	
	pass # Replace with function body.
