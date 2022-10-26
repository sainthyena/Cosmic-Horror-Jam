extends Node2D

func _on_Corn_Trigger_area_entered(area):
	if Player:
		$Corn/CornAnim.play("close")
