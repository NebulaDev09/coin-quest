extends Node2D

var coins = 10
var goal = 100
var inventory = []

func removeCoin(amount):
	if coins - amount >= 0:
		coins -= amount
	else:
		coins = -1
		
func addCoin(amount):
	coins += amount
	
func buyItem(item, amount):
	if coins - amount >= 0:
		coins -= amount
		inventory.append(item)
	
