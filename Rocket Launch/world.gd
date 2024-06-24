extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var launch_button = $TextureButton
@onready var rocket_flare = $Rocket/RocketFlare

func _on_texture_button_button_down():
	rocket_flare.show()
	animation_player.play("Launch")
	launch_button.hide()
