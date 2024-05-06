extends AudioStreamPlayer

const resource: String = "res://tldoa_music.mp3"
const level_music = preload(resource)

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()

func play_music_level():
	_play_music(level_music)


func _on_finished():
	#print("signaled")
	stream = null
	play_music_level()
