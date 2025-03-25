extends CanvasLayer
@onready var _time_label : Label = get_node("Label")
@onready var _time_node : Timer = get_node("Timer")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#_time_node.start(302)


func _process(delta: float) -> void:
	update_time_label()


##Atualiza tempo na label
func update_time_label():
	_time_label.text =  str(int(_time_node.time_left/60)) + "min"


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/cut_scene_5.tscn")
	
