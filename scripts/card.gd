extends TextureRect

@export var front_texture: Texture2D
@export var back_texture: Texture2D

signal card_clicked(card)

var revealed = false

func _ready():
	back_texture = preload("res://assets/cards_light/BACK.png")
	self.texture = back_texture

func reveal():
	if revealed:
		return
	revealed = true
	self.texture = front_texture

func hide_card():
	if not revealed:
		return
	revealed = false
	self.texture = back_texture

func _on_button_pressed() -> void:
	emit_signal("card_clicked", self)
	reveal()
	
