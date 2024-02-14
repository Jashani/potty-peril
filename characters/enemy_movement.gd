extends Node

@export var actor: CharacterBody2D
@export var seconds_to_switch_direction := 2.0
@export var speed := 10000

var _target: CharacterBody2D

var _random = RandomNumberGenerator.new()
var _time_since_last_change := 0.0


func _ready():
	_target = get_node('/root/Main/Player') # UGLY!!! I HATE IT!!!!!!!!!!!!!


func _apply_velocity(direction: Vector2, delta: float):
	direction = direction.normalized()
	actor.velocity = direction * speed * delta


func _move_randomly(delta: float):
	var random_direction = Vector2(_random.randf_range(-1, 1), _random.randf_range(-1, 1))
	_apply_velocity(random_direction, delta)


func _move_towards_target(delta: float):
	var direction = _target.global_position - actor.global_position
	_apply_velocity(direction, delta)


func _physics_process(delta):
	if _time_since_last_change > seconds_to_switch_direction:	
		_move_towards_target(delta)
		_time_since_last_change = 0
	_time_since_last_change += delta
