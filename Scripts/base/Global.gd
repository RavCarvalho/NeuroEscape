extends Node

var senha_correta : = false #varificação pra todas as cenas
var right_box_pw = [2, 5, 3] #senha do bau
var numb_pw : Array = [] 
var unlocked = false
var puzzleterminado = false #var para teste de puzzle
var pass_scene = false #var para teste com chave

var skip_cutscene = false# var verificação p pular  cutscene


signal send_status_pw
signal finishpuzzle 

func _ready() -> void:

	pass 



func _process(delta: float) -> void:
	puzzlecompare()

func comapare_password():
	if numb_pw == right_box_pw:
		senha_correta = true
		print("certoouuu certooouuuuu")
	else:
		senha_correta = false
		print("Erradoouuu  ")
	numb_pw.clear()
	send_status_pw.emit()
	
func puzzlecompare():
	if puzzleterminado == true:
		#print("puzzle terminado")
		finishpuzzle.emit()
	pass
