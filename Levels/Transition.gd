extends Node2D

var done_in_transition = 0
var done_out_transition = 0
onready var intimer = $InTimer
onready var outtimer= $OutTimer
onready var animationPlayer = $AnimationPlayer
#export (NodePath) var TargetNodePath
#onready var targetnode = get_node(str(TargetNodePath))

#func _process(delta):
	#global_position = targetnode.global_postion
func transition_enter():
	animationPlayer.play("Fade_In")
	
func transition_exit():
	animationPlayer.play("")
	
	
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fade_In":
		intimer.start()
		done_in_transition = 1
		
	elif anim_name == "X":
		done_out_transition = 1
		outtimer.start()
		
func get_in_transition():
	return done_in_transition
	
func get_out_transition():
	return done_out_transition
	


func _on_InTimer_timeout():
	done_in_transition = 0
	intimer.stop()
	pass # Replace with function body.


func _on_OutTimer_timeout():
	done_out_transition
	outtimer.stop()
	pass # Replace with function body.
