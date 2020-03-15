extends Node


onready var Coin_Scene = load("res://Coin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for coin in GameState.level2coins:
		var newCoin = Coin_Scene.instance()
		newCoin.position=coin
		$Coins.add_child(newCoin)
		GameState.level=2
