extends KinematicBody2D

export (int) var speed = 200
onready var walk = $PlayerWalkSound
var velocity = Vector2()

func _ready():
	$PlayerWalkSound/VolumeAdjust.play("normal_volume")
	
func play_audio():
	if not walk.playing and velocity.x != 0:
			$PlayerWalkSound/VolumeAdjust.play("normal_volume")
			walk.play()
#func ready():
#	if velocity.x != 0:
#		if !walk.playing:
#			walk.play()
#			print ("audio should be working")
#		elif walk.playing:
#			walk.stop()
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		$PlayerWalkSound/VolumeAdjust.play("normal_volume")
		velocity.x += 1 
		play_audio()
	if Input.is_action_just_released("ui_right"):
		$PlayerWalkSound/VolumeAdjust.play("lower_volume")
#		walk.stop()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
