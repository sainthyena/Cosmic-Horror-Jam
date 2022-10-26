extends Area2D


func _on_Entry_To_Town_area_entered(area):
	if Player:
#		Spawnpoint.spawn_name = name 
		LevelManager.start_level("Entry_Town")
