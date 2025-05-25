extends Node2D
@onready var score_timer: Timer = $ScoreTimer

@onready var game_over_sprite: Sprite2D = $GameOver
@onready var reset_button: TextureButton = $ResetButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.game_over.connect(manage_high_score)
	Signals.game_over.connect(score_timer.stop)
	Signals.game_over.connect(toggle_game_over_screen)
	Signals.space_is_pressed.connect(_on_reset_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if score_timer.is_stopped() and Global.is_play():
		score_timer.start()

func _on_score_timer_timeout() -> void:
	Global.score +=1
	
	Signals.increase_score_label.emit()
	if Global.score % 100 == 0:
		Global.game_speed +=20
		SoundManager.play_points_sound()

func manage_high_score():
	if Global.score > Global.highscore:
		Global.highscore = Global.score
		Signals.update_high_score_label.emit()

func toggle_game_over_screen():
	game_over_sprite.visible = not game_over_sprite.visible
	reset_button.visible = not reset_button.visible

func _on_reset_button_pressed() -> void:
	if Global.is_play():
		return 
	toggle_game_over_screen()
	Global.game_speed = Global.BASE_GAME_SPEED
	Global.set_state_to_play()
	get_tree().reload_current_scene()
	


	
