extends CanvasLayer

@onready var player_txt : RichTextLabel = get_node("text")


func _ready() -> void:
	player_txt.text = ""


func _process(delta: float) -> void:
	player_txt.visible = player_txt.text != ""


func _on_timer_timeout() -> void:
	player_txt.text = ""
