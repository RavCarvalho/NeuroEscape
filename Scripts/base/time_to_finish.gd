extends CanvasLayer
@onready var _time_label : Label = get_node("Label")
@onready var _time_node : Timer = get_node("Timer")

var elapsed_time : float = 0  # Contador do tempo que já passou

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#_time_node.start(302)


func _process(delta: float) -> void:
	update_time_label()

	#update_time_label()
	pass

##Atualiza tempo na label
#func update_time_label():
	#_time_label.text =  str(int(_time_node.time_left/60)) + "min"


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/cut_scene_5.tscn")
	
## Atualiza o tempo na label
func update_time_label() -> void:
	# Calcula o tempo restante no Timer
	var remaining_time = int(_time_node.time_left)
	
	# Converte o tempo restante em minutos e segundos
	var minutes = remaining_time / 60
	var seconds = remaining_time % 60
	
	# Atualiza a label para exibir no formato "MM:SS"
	_time_label.text = str(minutes).pad_zeros(2) + ":" + str(seconds).pad_zeros(2)
