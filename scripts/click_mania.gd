extends Control

@onready var card = $card
@onready var score_label = $score
@onready var time_left = $time_left
@onready var timer = $gameTimer

var score = 0

func _ready() -> void:
	randomize()
	card.position = newPosition()
	$gameTimer.start()
	$cardTimer.start()

func _on_card_pressed() -> void:
	score += 1
	score_label.text = "Score: " + str(score)
	$cardTimer.start()
	_on_card_timer_timeout()

func _process(delta: float) -> void:
	time_left.text = "Time left: " + str(int(timer.time_left))

func newPosition():
	return Vector2(randi_range(0, 1700), randi_range(0, 700))

func _on_card_timer_timeout() -> void:
	card.position = newPosition()
	
func _on_game_timer_timeout() -> void:
	Global.addCoins(score)
	get_tree().change_scene_to_file("res://scenes/arcade_hall.tscn")
