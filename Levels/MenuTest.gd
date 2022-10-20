extends Area2D
onready var animationplayer = $AnimationPlayer

func _on_MenuTest_area_entered(area):
	animationplayer.play("Speaking")
