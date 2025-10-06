extends Node

var coins: int = 10
var inventory: Array

func addCoins(amount: int):
	coins += amount

func removeCoins(amount: int):
	if coins >= amount:
		coins -= amount
	else:
		coins = 0
