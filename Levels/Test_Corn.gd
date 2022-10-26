extends Node2D
signal RemovePauseMenu()
onready var tone = $Tone
onready var crows = $Crows

func _process(delta):
	if not tone.is_playing():
			tone.play()
	if not crows.is_playing():
			crows.play()



func _on_In_Corn_timeout():
	$YSort/Player/Corn_Shadow.visible = true
