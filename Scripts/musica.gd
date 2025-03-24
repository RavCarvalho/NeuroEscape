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
	"clickbotao" : preload("res://Musica/spacebar-click-keyboard-199448.mp3"),
	"protocoloativado": preload("res://Musica/protocoloXativado.mp3"),
	"error": preload("res://Musica/error.mp3"),
	"tempovoa": preload("res://Musica/falas oficiais/Como_tempo_voa_1.mp3"),
	"trouxedecasa":preload("res://Musica/falas oficiais/touxe de casa.mp3"),
	"estante": preload("res://Musica/falas oficiais/Trofus_1.mp3"),
	"elevador": preload("res://Musica/falas oficiais/Preso_1_1.mp3"),
	"digito": preload("res://Musica/digitp.mp3"),
	"chefealien": preload("res://Musica/falas oficiais/Chefe_aliengena_1.mp3"),
	
}

# Node references:
@onready var musicPlayer : AudioStreamPlayer = get_node("MusicPlayer")

func playMusic(musicKey: String) -> void:
	var _music = musicDict.get(musicKey)
	musicPlayer.stream = _music
	musicPlayer.play()
	if musicKey == "calma":
		musicPlayer.volume_db = -15.0
	else: musicPlayer.volume_db = -8.
	
func playSFX(musicKey: String) -> void:
	var _audio = AudioStreamPlayer.new()
	add_child(_audio)
	var _sound = musicDict.get(musicKey)
	_audio.stream = _sound
	_audio.volume_db = 10.0
	_audio.play()
	
	# Conectar o sinal "finished" para destruir o áudio quando terminar
	_audio.finished.connect(_on_audio_finished.bind(_audio))
	
# Função para lidar com o sinal "finished" e destruir o _audio
func _on_audio_finished(_audio: AudioStreamPlayer) -> void:
	_audio.queue_free()
