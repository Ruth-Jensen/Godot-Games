extends Area2D

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@export var speed = 80

func _process(delta):
	# heres one way of telling if a move key is pressed - vector (left, right, up, down) 
	var input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	#position and input_vector are both vectors so this works
	position += input_vector * speed * delta
	
	# heres another way of telling if a move key is being pressed
	#if Input.is_action_pressed("move_right"):
		#position.x += speed * delta
	#if Input.is_action_pressed("move_left"):
		#position.x -= speed * delta
	#if Input.is_action_pressed("duck"):
		#position.y += speed * delta
	#if Input.is_action_pressed("jump"):
		#position.y -= speed * delta
	
	# checks to see if the vector is equal to zero (not moving)
	if input_vector == Vector2.ZERO:
		# play idle animation
		animation_player.play("idle")
	
	# else if the vector is not equal to zero (is moving)
	else:
		# play run animation
		animation_player.play("run")
		
		# heres one way of changing directions
		if input_vector.x != 0:
			# change the scale of the sprite to be the same sign (- or +)  as the vector
			sprite_2d.scale.x = sign(input_vector.x)
		
		# heres another way of changing directions
		#if input_vector.x > 0:
			#sprite_2d.scale.x = 1
		#else:
			#sprite_2d.scale.x = -1

# area is the area this object is colliding with (in this case the apple's area)
func _on_area_entered(area):
	# queue_free destroys it's target once the queue is free (this is the safe way to destroy something)
	# area(apple).queue_free(destroy)
	area.queue_free()
	# this is the scale of the node not the scale of the sprite
	scale *= 1.1
