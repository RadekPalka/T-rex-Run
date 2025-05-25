extends Area2D

class_name Obstacle

@onready var sprite: Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	if Global.is_play():
		global_position.x -= Global.game_speed * delta

func get_sprite_height():
	return sprite.texture.get_size().y

func get_sprite_width():
	return sprite.texture.get_size().x


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		SoundManager.play_dead_sound()
		Signals.game_over.emit()
