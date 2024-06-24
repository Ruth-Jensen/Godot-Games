extends Area2D

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@export var speed = 270
var facing = "idle"


func _ready():
	scale *= 0.5

func _process(delta):
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += input_vector * speed * delta
	
	if input_vector == Vector2.ZERO:
		animation_player.play(facing)
	
	else:
		if input_vector.y > 0:
			animation_player.play("walking_front")
			facing = "idle_front"
		elif input_vector.y < 0:
			animation_player.play("walking_back")
			facing = "idle_back"
		else:
			animation_player.play("walking")
			facing = "idle"
			
			if input_vector.x != 0:
				sprite_2d.scale.x = sign(input_vector.x)
				
func _on_area_entered(area):
	area.queue_free()
