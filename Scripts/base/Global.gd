extends Node

var senha_correta : = false
var right_box_pw = [2, 5, 3]
var numb_pw : Array = []

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func comapare_password():
	if numb_pw == right_box_pw:
		senha_correta = true
		print("certoouuu certooouuuuu")
	else:
		senha_correta = false
		numb_pw.clear()
		print("Erradoouuu  ")
