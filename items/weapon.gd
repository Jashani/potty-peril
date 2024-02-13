extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var distance = get_global_mouse_position() - self.global_position
	self.rotation = distance.angle() + (PI / 2) # Angle is in relation to the right

