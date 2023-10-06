extends Area2D

@export var _speed: float = 2000.0
@export var _anim: AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	var player: Player = body as Player
	if player:
		player.jump(_speed)
		_anim.play("default")
