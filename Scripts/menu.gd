extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_up() -> void:
	$email.visible = true


func _on_sair_button_up() -> void:
	get_tree().quit()  # Fecha o aplicativo


func _on_fechar_email_button_up() -> void:
	$email.visible = false


func _on_tutorial_button_up() -> void:
	$tutorial2.visible = true


func _on_fechartutorial_button_up() -> void:
	$tutorial2.visible = false
