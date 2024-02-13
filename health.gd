class_name Health
extends Node


@export var max_health := 10.0

var health: float


# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health


func damage(amount: float):
	health -= amount
	if health <= 0:
		die()


func die():
	pass
