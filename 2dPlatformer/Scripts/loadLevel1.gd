extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Coin_Scene = load("res://Coin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for coin in GameState.level1coins:
		var newCoin = Coin_Scene.instance()
		newCoin.position=coin
		$Coins.add_child(newCoin)
		GameState.level=1
