class_name Patrol
extends Node2D

signal reached_start_position
signal reached_end_position

@export var _speed: float = 100.0
@export var _start: Marker2D
@export var _end: Marker2D
@export var _target: Node2D

var _next_position: Vector2
var _min_distance_to_checkpoint: float = 2.0

func get_dir() -> Vector2:
	return (_next_position - _target.global_position).normalized()

func _ready() -> void:
	_target.global_position = _start.global_position
	_next_position = _end.global_position

func _process(delta: float) -> void:
	_target.global_position += get_dir() * _speed * delta
	if _is_close_to_checkpoint():
		_change_checkpoint()

func _is_close_to_checkpoint() -> bool:
	return _target.global_position.distance_to(_next_position) < _min_distance_to_checkpoint

func _change_checkpoint() -> void:
	if _next_position == _start.global_position:
		_next_position = _end.global_position
		reached_start_position.emit()
	else:
		_next_position = _start.global_position
		reached_end_position.emit()
