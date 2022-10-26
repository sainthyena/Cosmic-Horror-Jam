extends Node2D

func _ready():
	GlobalWind.stop()
	QuarryVisited.quarry_visited = true
	SignalBus.emit_signal("display_dialog")
	



func _on_Timer_timeout():
	LevelManager.start_level("Entry_Town")
