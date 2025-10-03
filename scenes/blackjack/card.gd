extends Control

@onready var sprite = $Sprite2D

func change(position: Vector2):
	sprite.region_rect = Rect2(position, Vector2(48, 64))
