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
	if not walk.playing and velocity.y != 0:
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
		$PlayerWalkSound/VolumeAdjust.play("normal_volume")
		velocity.x -= 1
		play_audio()
	if Input.is_action_just_released("ui_left"):
		$PlayerWalkSound/VolumeAdjust.play("lower_volume")
		
	if Input.is_action_pressed("ui_down"):
		$PlayerWalkSound/VolumeAdjust.play("normal_volume")
		velocity.y += 1
		play_audio()
		
	if Input.is_action_just_released("ui_down"):
		$PlayerWalkSound/VolumeAdjust.play("lower_volume")
		
	if Input.is_action_pressed("ui_up"):
		$PlayerWalkSound/VolumeAdjust.play("normal_volume")
		velocity.y -= 1
		play_audio()
	if Input.is_action_just_released("ui_up"):
		$PlayerWalkSound/VolumeAdjust.play("lower_volume")
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
#	self.position = get_parent().get_node("Position2D").position
	velocity = move_and_slide(velocity)


func _on_Corn_Fields_TeleporterUP_area_entered(area):
	
	get_tree().change_scene_to(load('res://TestMaps/Test_Corn.tscn'))
	pass # Replace with function body.
