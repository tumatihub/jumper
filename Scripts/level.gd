class_name Level
extends Node2D

var _coins:Array[Node]
var _collected_coins:int = 0

func _ready() -> void:
	_coins = get_tree().get_nodes_in_group("coins")
	for node in _coins:
		var coin:Coin = node as Coin
		if coin:
			coin.collected.connect(_handle_collected_coin)

func _handle_collected_coin() -> void:
	_collected_coins += 1
	print(_collected_coins)
