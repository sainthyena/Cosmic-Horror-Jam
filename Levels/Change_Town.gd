extends Area2D



func _on_Change_Town_area_entered(area):
	if Player:
			LevelManager.start_level("In_Town") 
