extends Control

@onready var playerRegion = $playerRegion
@onready var dealerRegion = $dealerRegion

var rng = RandomNumberGenerator.new()
var score = 0


func _on_button_pressed() -> void:
	var x = rng.randi_range(0, 12) * 48
	var y = rng.randi_range(0, 3) * 64
	score += x + 1
	$playerRegion/card.change(Vector2(x, y))
