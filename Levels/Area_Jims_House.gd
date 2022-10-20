extends Area2D

func _on_Area_Jims_House_area_entered(area):
	if Player:
		LevelManager.start_level("Jim_House")
