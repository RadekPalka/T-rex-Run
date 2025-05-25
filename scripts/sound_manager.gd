extends Node

var jump_sound = AudioStreamPlayer2D.new()
var dead_sound = AudioStreamPlayer2D.new()
var points_sound = AudioStreamPlayer2D.new()

func _ready() -> void:
	jump_sound.stream = preload("res://sounds/jump.mp3")
	dead_sound.stream = preload("res://sounds/die.mp3")
	points_sound.stream = preload("res://sounds/point.mp3")
	add_child(jump_sound)
	add_child(dead_sound)
	add_child(points_sound)

func play_jump_sound():
	jump_sound.play()

func play_dead_sound():
	dead_sound.play()

func play_points_sound():
	points_sound.play()
	
