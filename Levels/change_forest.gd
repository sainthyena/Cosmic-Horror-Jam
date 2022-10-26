extends Area2D



func _on_Area2D_area_entered(area):
	if Player:
		LevelManager.start_level("Forest_Entrance")
