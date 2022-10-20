extends Area2D
#
func _on_Corn_Enter_area_entered(area):
	if Player:
		LevelManager.start_level("Test_Corn")
