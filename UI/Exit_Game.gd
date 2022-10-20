extends Node2D
onready var animationplayer = $AnimationPlayer
onready var timer = $Timer

func _ready():
	animationplayer.play("TextClose")

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		if not timer.time_left > 0:
			animationplayer.play("TextAnim")
			timer.start()
	if Input.is_action_just_released("ui_cancel"):
		animationplayer.play("TextClose")
		timer.stop()
		print("timer stopped")

func _on_Timer_timeout():
	get_tree().quit()
