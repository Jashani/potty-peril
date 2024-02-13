extends Node

@export var actor: CharacterBody2D
@export var seconds_to_switch_direction := 2.0
@export var speed := 10000

var _random = RandomNumberGenerator.new()
var _time_since_last_change := 0.0

func _move_randomly(delta: float):
	var random_direction = Vector2(_random.randf_range(-1, 1), _random.randf_range(-1, 1))
	random_direction = random_direction.normalized()
	actor.velocity = random_direction * speed * delta


func _physics_process(delta):
	if _time_since_last_change > seconds_to_switch_direction:	
		_move_randomly(delta)
		_time_since_last_change = 0
	_time_since_last_change += delta
