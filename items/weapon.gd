extends Node2D


@export var animation_controller: AnimationPlayer
@export var weapon_area: Area2D

@export var damage: float = 5.0


func _input(event: InputEvent):
	if Input.is_action_just_pressed("attack"):
		print("Whack!")
		_whack()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var distance = get_global_mouse_position() - self.global_position
	self.rotation = distance.angle() + (PI / 2) # Angle is in relation to the right


func _whack():
	animation_controller.play("whack")
	var bodies_hit = weapon_area.get_overlapping_bodies()
	for body in bodies_hit:
		if body.name == 'Enemy':
			var enemy_health = body.find_child("Health")
			enemy_health.damage(damage)
