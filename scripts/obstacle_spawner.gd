extends Node2D

@export var obstacles : Array[PackedScene]
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player") as Player
@onready var timer: Timer = $Timer
var y
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	y = player.global_position.y + player.get_sprite_height() /2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if timer.is_stopped() and Global.is_play():
		timer.wait_time = randf_range(1, 2)
		timer.start()
	elif Global.is_dead():
		timer.stop()


func _on_timer_timeout() -> void:
	var obstacleScene : PackedScene = obstacles.pick_random() as PackedScene
	var obstacle = obstacleScene.instantiate() as Obstacle
	var speed_ratio = Global.BASE_GAME_SPEED / Global.game_speed
	add_child(obstacle)
	obstacle.global_position = Vector2(get_viewport().get_visible_rect().size.x+ obstacle.get_sprite_width(), y- obstacle.get_sprite_height()/2)
	timer.wait_time = randf_range(1.5, 2) * speed_ratio
	
	
