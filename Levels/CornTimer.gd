extends Area2D

onready var timer = $Timer
var timer_ended =false
var is_down = false
var activePlayer: Player
export var levelId: String
onready var activeSaved = false


func get_input():
	if Input.is_action_pressed('ui_down'):
		_on_Button_button_down()
	if Input.is_action_just_released('ui_down'):
		_on_Button_button_up()

func _ready():
	print ("ready")
	timer.wait_time = 3
	timer.one_shot = true
	timer.autostart = false
	
func _physics_process(delta):
	get_input()
	if is_down and timer_ended:
		success()
	
func _on_Button_button_down():
	is_down = true
	if not $Timer.time_left > 0:
		timer.start()
func _on_Button_button_up():
	is_down = false
	
func _on_Timer_timeout():
	timer_ended = true
	
	
func success():
	if Player and !activeSaved:
		UserDataManager.set_data("save-file", { level = levelId })
		UserDataManager.save_data()
		activeSaved = true
		LevelManager.goto_scene("res://Levels/IntroCutscene.tscn")
