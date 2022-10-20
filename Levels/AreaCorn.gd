extends Area2D



func _on_AreaCorn_area_entered(area):
	if Player:
		LevelManager.start_level("Test_Corn")
