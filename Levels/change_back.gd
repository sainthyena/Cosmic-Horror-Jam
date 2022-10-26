extends Area2D



func _on_ChangeLevelTrigger2_area_entered(area):
	if Player and QuarryVisited.quarry_visited:
		LevelManager.start_level("Quarry")
	else:
		LevelManager.start_level("After_Quarry")


func _on_ChangeLevelTrigger3_area_entered(area):
	if Player:
		LevelManager.start_level("Forest_Entrance")
