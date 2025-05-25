extends CharacterBody2D

class_name Player
const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var isJuming = false
@onready var sprite: AnimatedSprite2D = $Sprite

func _ready() -> void:
	Signals.space_is_pressed.connect(jump)
	add_to_group("player")



func _physics_process(delta: float) -> void:
	if Global.is_dead():
		return
	if not is_on_floor() and Global.is_play():
		velocity += get_gravity() * delta
	
	move_and_slide()
	if is_on_floor():
		isJuming = false
	manage_player_state()

func jump():
	if Global.is_dead() or not is_on_floor():
		return
	SoundManager.play_jump_sound()
	velocity.y = JUMP_VELOCITY
	isJuming = true

func manage_player_state():
	if Global.is_play() and is_on_floor() and not isJuming and sprite.animation != "run":
		sprite.play("run")
	elif isJuming and sprite.animation != "idle_and_jump":
		sprite.play("idle_and_jump")
	elif Global.is_dead():
		sprite.play("dead")

func get_sprite_height():
	var frames = sprite.sprite_frames
	return frames.get_frame_texture("idle_and_jump", 0).get_size().y
