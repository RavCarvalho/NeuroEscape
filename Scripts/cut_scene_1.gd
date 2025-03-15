extends Node2D
@onready var anim_node = get_node("Secene")

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_secene_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://Scenes/level_0_pc.tscn")
