extends AudioStreamPlayer
signal PlayingDefaultMusic()

func _ready():
#	$Default_Music.play()
	emit_signal("PlayingDefaultMusic")
	
