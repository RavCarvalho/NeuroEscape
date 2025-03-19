extends CanvasLayer

@onready var player_txt : RichTextLabel = get_node("text")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_txt.visible = player_txt.text != ""


func _on_timer_timeout() -> void:
	player_txt.text = ""
