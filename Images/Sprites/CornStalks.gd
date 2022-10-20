extends Node2D
onready var animationplayer = $AnimationPlayer
onready var timer = $Move_Timer
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	$Start_Timer.start()
	$Repeat_Timer.start()
	
func pick_animation():
	var pick = rng.randi() % 8
	print(pick)
	if(pick <= 2):
		move_stalks()
	elif(pick >= 3):
		animationplayer.play("Idle")
		
func move_stalks():
	animationplayer.play("Moving")
	timer.start()

func _on_Timer_timeout():
	pick_animation()


func _on_Start_Timer_timeout():
	pick_animation()


func _on_Repeat_Timer_timeout():
	pick_animation()

