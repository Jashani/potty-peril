extends Area2D


func _input(event):
	if Input.is_action_just_pressed("interact"):
		var overlapping_areas = self.get_overlapping_areas()
		for area in overlapping_areas:
			var object = area.get_parent()
			if object is Door:
				object.open()
				break
