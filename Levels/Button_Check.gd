extends Area2D
var is_down = false
var no_more = false
onready var timer = $Timer
var timer_ended = false



func get_input():
	if Input.is_action_pressed("ui_down"):
		_on_Button_button_down()

	if Input.is_action_just_released("ui_down"):
		_on_Button_button_up()

func _physics_process(delta):
	get_input()
	if is_down and timer_ended:
		no_more = true
		success()
#
func _ready():
	print ("ready")
	timer.wait_time = 3
	timer.one_shot = true
	timer.autostart = false


func _on_Button_button_down():
	
	is_down = true
	if not $Timer.time_left > 0:
		timer.start()
		print ("timerstarted")
	

func _on_Button_button_up():
#	if $Timer.time_left > 0:
#		timer.start()
#		print ("stopped")
	is_down = false
	no_more = false

func _on_Timer_timeout():
	timer_ended = true
	LevelManager.goto_scene("res://Levels/Jim_House.tscn")
	print ("timed out")
