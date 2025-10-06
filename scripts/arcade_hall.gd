extends Control

func _process(delta: float) -> void:
	$Label.text = str(Global.coins)

func _on_reaction_time_pressed() -> void:
	var popup_instance = preload("res://scenes/popup.tscn")
	var popup = popup_instance.instantiate()
	popup.title = "Reaction time"
	popup.description = "Click on the card before it disappears.
	Cost = 3 coins"
	$".".add_child(popup)
	popup._play.connect(_change_to_click_mania)

func _change_to_click_mania():
	Global.removeCoins(3)
	get_tree().change_scene_to_file("res://scenes/click_mania.tscn")

func _on_card_matcher_pressed() -> void:
	var popup_instance = preload("res://scenes/popup.tscn")
	var popup = popup_instance.instantiate()
	popup.title = "Card matcher"
	popup.description = "Match cards based upon memory.
	Cost = 2 coins"
	$".".add_child(popup)
	popup._play.connect(_change_to_card_matcher)

func _change_to_card_matcher():
	Global.removeCoins(2)
	get_tree().change_scene_to_file("res://scenes/card_flipper/coin_pair.tscn")
