extends Node2D

func _ready():
	$EngineSFX.play()

func _on_Timer_timeout():
	LevelManager.goto_scene("res://Levels/Jim_House.tscn")



func _on_AudioStreamPlayer_finished():
	SignalBus.emit_signal("display_dialog")
