class_name Player
extends CharacterBody2D

@export var _gravity:float = 10.0
@export var _speed:float = 120.0
@export var _jump_speed:float = 300.0
@export var _max_vertical_speed:float = 500.0

@onready var _animated_sprite:AnimatedSprite2D = $AnimatedSprite2D as AnimatedSprite2D

var _direction: float = 0
var _is_active: bool = true

func jump(speed: float) -> void:
	velocity.y = -speed

func _physics_process(_delta:float) -> void:
	_direction = 0
	if not is_on_floor():
		if Input.is_action_just_released("jump") and (velocity.y < -_jump_speed / 2):
			velocity.y = -_jump_speed/2
		velocity.y += _gravity# * delta
	velocity.y = minf(velocity.y, _max_vertical_speed)
	if _is_active and is_on_floor() and Input.is_action_just_pressed("jump"):
		jump(_jump_speed)
	
	if _is_active:
		_update_direction()
		
	if _direction != 0:
		_animated_sprite.flip_h = _direction == -1
	
	velocity.x = _direction * _speed# * delta
	move_and_slide()
	_update_animations()

func _update_direction() -> void:
	_direction = Input.get_axis("move_left", "move_right")

func _update_animations() -> void:
	if is_on_floor():
		if _direction == 0:
			_animated_sprite.play("stand")
		else:
			_animated_sprite.play("walk")
	else:
		_animated_sprite.play("jump")

