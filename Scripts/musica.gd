extends Node
var musicDict : Dictionary = {
	"suspense" : preload("res://Musica/musica suspense.mp3"),
	"calma" : preload("res://Musica/musica calma.mp3"),
	"efeitoluz": preload("res://Musica/light-switch-81967.mp3"),
	"estrondo": preload("res://Musica/estrondo.mp3"),
	"portadestrancada": preload("res://Musica/close-door-sound-247450.mp3"),
	"gaveta": preload("res://Musica/gaveta.mp3"),
	"papel": preload("res://Musica/papel.mp3"),
	"beep" : preload("res://Musica/beep.mp3"),
	"sirene" : preload("res://Musica/sirene.mp3"),
	"email" : preload("res://Musica/email.mp3"),
	"planta" : preload("res://Musica/planta.mp3"),
	"relogioapertado" : preload("res://Musica/relogioapertei.mp3"),
	"relogiochefão" : preload("res://Musica/relogio chefao.mp3"),
	"clickbotao" : preload("res://Musica/spacebar-click-keyboard-199448.mp3")
}

# Node references:
@onready var musicPlayer : AudioStreamPlayer = get_node("MusicPlayer")

func playMusic(musicKey: String) -> void:
	var _music = musicDict.get(musicKey)
	musicPlayer.stream = _music
	musicPlayer.play()
	
func playSFX(musicKey: String) -> void:
	var _audio = AudioStreamPlayer.new()
	add_child(_audio)
	var _sound = musicDict.get(musicKey)
	_audio.stream = _sound
	_audio.play()
	
	# Conectar o sinal "finished" para destruir o áudio quando terminar
	_audio.finished.connect(_on_audio_finished.bind(_audio))
	
# Função para lidar com o sinal "finished" e destruir o _audio
func _on_audio_finished(_audio: AudioStreamPlayer) -> void:
	_audio.queue_free()
