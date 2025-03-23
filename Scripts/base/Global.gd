extends Node

var senha_correta : = false
var right_box_pw = [2, 5, 3]
var numb_pw : Array = []
var unlocked = false
signal send_status_pw

func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	pass

func comapare_password():
	if numb_pw == right_box_pw:
		senha_correta = true
		print("certoouuu certooouuuuu")
	else:
		senha_correta = false
		print("Erradoouuu  ")
	numb_pw.clear()
	send_status_pw.emit()
