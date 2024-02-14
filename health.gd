class_name Health
extends Node


@export var max_health := 10.0
@export var death_particles: PackedScene

var health: float


# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health


func damage(amount: float):
	health -= amount
	if health <= 0:
		die()


func die():
	print("I'M DEAD!!!")
	var parent: CharacterBody2D = self.get_parent()
	var particles_scene = death_particles.instantiate()
	particles_scene.position = parent.global_position
	get_tree().root.add_child(particles_scene)
	var particles: CPUParticles2D = particles_scene.get_child(0)  # There must be a better way to do this
	particles.emitting = true
	parent.queue_free()
