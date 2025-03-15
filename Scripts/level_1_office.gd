extends Node2D

enum interactve_with { empty, r_drawer, l_drawer, door, tranca, estante, window, coffee}
var frases : Array = ["aa"]


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interactive_iten(event, id, time):
	pass

func _on_right_drawer_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var zoom_drawer = get_node("Drawer_R").visible
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			$Drawer_R.visible = true


func _on_to_open_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton  and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT and $Drawer_R/drawer_open.visible == false:
			$Drawer_R/drawer_open.visible = true
		else: $Drawer_R/Files.visible = true
		if event.button_index == MOUSE_BUTTON_LEFT and $Drawer_R/Files.visible == true:
			$Drawer_R/Files/fileOpen.visible =  true
			$Drawer_R/Files/label.text = "Arq. Confidencial

[center]A Fase 3 foi um sucesso parcial. Os impulsos nervosos responderam ao estímulo, mas a consciência... [i]fragmentou-se. [/i]Precisamos recalibrar a frequência antes da próxima rodada.

[b]Aviso: este documento deve ser destruído após a leitura"
