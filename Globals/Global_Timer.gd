extends Timer

func _on_Global_Timer_timeout():
	$CanvasLayer/AnimationPlayer.play("Fade_In")
	print ("finished")
