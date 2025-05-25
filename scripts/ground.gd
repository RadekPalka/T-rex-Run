extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not Global.is_play():
		return
	global_position.x -= Global.game_speed *delta
	if global_position.x < -texture.get_width() * scale.x:
		global_position.x = texture.get_width() * scale.x-10
