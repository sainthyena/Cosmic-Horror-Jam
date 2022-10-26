extends Node2D
onready var spriteAnimation = $Sprite_Animation


func _ready():
	if QuarryVisited.quarry_visited:
		self.queue_free()
	
func _process(delta):
	var pick = randi() % 2
	if(pick == 0) and not spriteAnimation.is_playing():
		spriteAnimation.play("Blink")

	elif(pick == 1) and not spriteAnimation.is_playing():
		spriteAnimation.play("Idle")

