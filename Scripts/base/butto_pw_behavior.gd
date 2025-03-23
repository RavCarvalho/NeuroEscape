extends Button

var valor = 0

func _ready() -> void:
	update_text()
	pressed.connect(_on_pressed)


func _on_pressed():
	MusicManager.playSFX("digito")
	## Valor soma 1 até 9 volta a 0 
	valor = (valor + 1) % 10
	update_text()
	release_focus()



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("entrar"):
		Global.numb_pw.append(valor)
		print(Global.numb_pw)
		if Global.numb_pw.size() >= 3:
			Global.comapare_password()


func update_text():
	text = str(valor)
