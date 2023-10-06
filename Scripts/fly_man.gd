extends Node2D

@export var _anim: AnimationPlayer
@export var _patrol: Patrol

func _on_patrol_reached_start_position() -> void:
	_change_anim()

func _on_patrol_reached_end_position() -> void:
	_change_anim()

func _change_anim() -> void:
	if _patrol.get_dir().y < 0:
		_anim.play("up")
	else:
		_anim.play("down")
