extends KinematicBody2D
class_name Player
export var levelId: String
export (int) var speed = 1000
onready var walk = $FootstepPlayer/VolumeControl
onready var FootstepSound = $FootstepPlayer 
#onready var pauseMenu = 'res://Scenes/Pause_Menu.tscn'
#onready var pauseMenu = $Pause_Menu
var show_pause = true

onready var animationplayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

var velocity = Vector2()

func _ready():
	animationplayer.play("Idle_Front")
	
func showPauseMenu():
	pass
#	if Input.is_action_just_pressed("pause") and show_pause:
#		get_tree().change_scene_to(load('res://Scenes/Pause_Menu.tscn'))
	
func play_audio():
	if not walk.is_playing() and not FootstepSound.is_playing():
			$FootstepPlayer.play()
func stop_audio():
	if walk.is_playing():
		walk.play("VolumeLower")
	
func get_input():
	
	velocity = Vector2.ZERO
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = velocity.normalized() * speed
	
	if Input.is_action_just_released("ui_right"):
		stop_audio()
	
	if velocity != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", velocity)
		animationTree.set("parameters/Walk/blend_position", velocity)
		animationState.travel("Walk")
		play_audio()
	else :
		animationState.travel("Idle")
		if walk.is_playing():
			play_audio()
		
func _physics_process(delta):
	get_input()
	#showPauseMenu()
	
#	self.position = get_parent().get_node("Position2D").position
	velocity = move_and_slide(velocity)

func _on_Save_Area_area_entered(area):
	
	UserDataManager.set_data("save-file", { level = levelId })
	UserDataManager.save_data()

