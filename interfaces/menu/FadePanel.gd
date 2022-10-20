extends ColorRect

signal fade_complete()

func _ready():
	$AnimationPlayer.connect("animation_finished", self, "_animation_complete")

func fadeIn():
	$AnimationPlayer.play("FadeOut");
	
func fadeOut():
	$AnimationPlayer.play("FadeIn");
	

func _animation_complete(name: String):
	if name == "FadeOut":
		mouse_filter = Control.MOUSE_FILTER_IGNORE
	emit_signal("fade_complete")
