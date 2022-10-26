extends Area2D



func _on_change_level_area_entered(area):
	if Player:
		LevelManager.start_level("Forest_Deep")
