extends KinematicBody2D
class_name Player
export var levelId: String
export (int) var speed = 200
onready var walk = $PlayerWalkSound/VolumeAdjust
#onready var pauseMenu = 'res://Scenes/Pause_Menu.tscn'
#onready var pauseMenu = $Pause_Menu
var show_pause = true

onready var animationplayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

var velocity = Vector2()

func _ready():
	print ($Camera2D.zoom.x)
	GlobalSettings.connect("zoom_changed", self, "on_zoom_changed")
	
func showPauseMenu():
	pass
#	if Input.is_action_just_pressed("pause") and show_pause:
#		get_tree().change_scene_to(load('res://Scenes/Pause_Menu.tscn'))
	
func play_audio():
	if not walk.is_playing():
			$PlayerWalkSound/VolumeAdjust.play("normal_volume")
func stop_audio():
	if walk.is_playing():
		$PlayerWalkSound/VolumeAdjust.play("lower_volume")
	
func get_input():
	
	velocity = Vector2.ZERO
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = velocity.normalized() * speed
	
	if velocity != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", velocity)
		animationTree.set("parameters/Walk/blend_position", velocity)
		animationState.travel("Walk")
		walk.play("normal_volume")
	else :
		animationState.travel("Idle")
		if walk.is_playing():
			walk.play("lower_volume")
		
func _physics_process(delta):
	get_input()
	#showPauseMenu()
	
#	self.position = get_parent().get_node("Position2D").position
	velocity = move_and_slide(velocity)

func _on_Save_Area_area_entered(area):
	
	UserDataManager.set_data("save-file", { level = levelId })
	UserDataManager.save_data()
	print ("saved game")
	pass # Replace with function body.


func _on_Jim_House_ShowPauseMenu():
	pass
#	show_pause = true
#	showPauseMenu()


func _on_Test_Corn_RemovePauseMenu():
	pass
#	show_pause = false
#	showPauseMenu()

func on_zoom_changed():
	
	$Camera2D.zoom.x = 2
	$Camera2D.zoom.y = 2
