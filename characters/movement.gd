extends Node

@export var actor: CharacterBody2D
#@export var sprites: Array[Sprite2D]
#@export var animation_controller: AnimationController


func _physics_process(delta):
	actor.move_and_slide()
#	_animate()

#
#func _animate():
#	if actor.velocity.x == 0 and actor.velocity.y == 0:
#		animation_controller.be_idle()
#	else:
#		animation_controller.walk()
