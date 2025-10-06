extends Control

@onready var grid = $GridContainer
var matched = 0
var pairs = 6

var first_card = null
var second_card = null

func _ready():
		setup_cards()
		
func build_deck():
	var deck = [
		preload("res://assets/cards_light/1-C.png"),
		preload("res://assets/cards_light/2-C.png"),
		preload("res://assets/cards_light/3-C.png"),
		preload("res://assets/cards_light/4-C.png"),
		preload("res://assets/cards_light/5-C.png"),
		preload("res://assets/cards_light/6-C.png"),
		preload("res://assets/cards_light/7-C.png"),
		preload("res://assets/cards_light/8-C.png"),
		preload("res://assets/cards_light/9-C.png"),
		preload("res://assets/cards_light/J-C.png"),
		preload("res://assets/cards_light/Q-C.png"),
		preload("res://assets/cards_light/K-C.png"),
		preload("res://assets/cards_light/A-C.png"),
		
		preload("res://assets/cards_light/1-D.png"),
		preload("res://assets/cards_light/2-D.png"),
		preload("res://assets/cards_light/3-D.png"),
		preload("res://assets/cards_light/4-D.png"),
		preload("res://assets/cards_light/5-D.png"),
		preload("res://assets/cards_light/6-D.png"),
		preload("res://assets/cards_light/7-D.png"),
		preload("res://assets/cards_light/8-D.png"),
		preload("res://assets/cards_light/9-D.png"),
		preload("res://assets/cards_light/J-D.png"),
		preload("res://assets/cards_light/Q-D.png"),
		preload("res://assets/cards_light/K-D.png"),
		preload("res://assets/cards_light/A-D.png"),
		
		preload("res://assets/cards_light/1-H.png"),
		preload("res://assets/cards_light/2-H.png"),
		preload("res://assets/cards_light/3-H.png"),
		preload("res://assets/cards_light/4-H.png"),
		preload("res://assets/cards_light/5-H.png"),
		preload("res://assets/cards_light/6-H.png"),
		preload("res://assets/cards_light/7-H.png"),
		preload("res://assets/cards_light/8-H.png"),
		preload("res://assets/cards_light/9-H.png"),
		preload("res://assets/cards_light/J-H.png"),
		preload("res://assets/cards_light/Q-H.png"),
		preload("res://assets/cards_light/K-H.png"),
		preload("res://assets/cards_light/A-H.png"),
		
		preload("res://assets/cards_light/1-P.png"),
		preload("res://assets/cards_light/2-P.png"),
		preload("res://assets/cards_light/3-P.png"),
		preload("res://assets/cards_light/4-P.png"),
		preload("res://assets/cards_light/5-P.png"),
		preload("res://assets/cards_light/6-P.png"),
		preload("res://assets/cards_light/7-P.png"),
		preload("res://assets/cards_light/8-P.png"),
		preload("res://assets/cards_light/9-P.png"),
		preload("res://assets/cards_light/J-P.png"),
		preload("res://assets/cards_light/Q-P.png"),
		preload("res://assets/cards_light/K-P.png"),
		preload("res://assets/cards_light/A-P.png"),
	]
	
	return deck
	
func build_random_pairs() -> Array:
	var deck = build_deck()
	deck.shuffle()
	var chosen = deck.slice(0, 9)
	var textures = []
	for tex in chosen:
		textures.append(tex)
		textures.append(tex)
		textures.shuffle()
	return textures

func setup_cards():
	var symbols = build_random_pairs()
	var card_scene = preload("res://scenes/card_flipper/card.tscn")
	for i in range(symbols.size()):
		var card = card_scene.instantiate()
		card.front_texture = symbols[i]
		card.back_texture = preload("res://assets/cards_light/BACK.png")
		card.connect("card_clicked", Callable(self, "_card_clicked"))
		grid.add_child(card)

func _card_clicked(card):
	if first_card == null:
		first_card = card
	elif second_card == null and card != first_card and card.revealed == false:
		second_card = card
		await get_tree().create_timer(0.5).timeout
		check_match()
	
func check_match():
		if first_card.front_texture == second_card.front_texture:
			matched += 1
			$score.text = "Score: " + str(matched)
			first_card = null
			second_card = null
		else:
			first_card.hide_card()
			second_card.hide_card()
			first_card = null
			second_card = null


func _process(_delta):
	$time_left.text = "Time left: " + str(int($gameTimer.time_left))
	

func _on_game_timer_timeout() -> void:
	Global.addCoins(matched*2)
	get_tree().change_scene_to_file("res://scenes/arcade_hall.tscn")
	
