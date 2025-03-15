extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_prancheta_button_up() -> void:
	$aviso.visible = true


func _on_voltar_elevador_button_up() -> void:
	$aviso.visible = false


func _on_setadireita_button_up() -> void:
	if $aviso.visible == false:
		$"porta escada".visible = true # Replace with function body.
		$elevador.visible = false




func _on_setaesquerda_button_up() -> void:
	if $curiosidade.visible == false:
		$"porta escada".visible = false # Replace with function body.
		$elevador.visible = true
	
	


func _on_papel_curiosidade_button_up() -> void:
	$curiosidade.visible = true


func _on_texture_button_button_up() -> void:
	$curiosidade.visible = false # Replace with function body.


func _on_bau_button_up() -> void:
	$"porta escada".visible = false
	$senha.visible = true


func _on_fecharsenha_button_up() -> void:
	$"porta escada".visible = true
	$senha.visible = false


func _on_cadeado_button_up() -> void:
	$"zoom da porta".visible = true


func _on_fechar_zoom_da_porta_button_up() -> void:
	$"zoom da porta".visible = false
