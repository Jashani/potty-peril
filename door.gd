class_name Door
extends Node2D


@export var open_door_image: CompressedTexture2D
@export var sprite: Sprite2D
@export var behind_me: Array[PackedScene]


var _opened: bool = false


func open():
	if _opened:
		return

	print("I have been opened!")
	_opened = true
	sprite.texture = open_door_image
	
	for scene in behind_me:
		scene.instantiate()
