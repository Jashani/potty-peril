extends Node


@export var actor: CharacterBody2D
@export var speed := 15000.0


func _add_velocity(delta: float):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	input_direction = input_direction.normalized()
	actor.velocity = input_direction * speed * delta


func _physics_process(delta):
	_add_velocity(delta)

