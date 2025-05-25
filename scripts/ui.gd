extends Control
@onready var start_game_label: Label = $StartGameLabel
@onready var timer: Timer = $Timer

@onready var score_label: Label = $ScoreLabel
@onready var high_score_label: Label = $HighScoreLabel
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.space_is_pressed.connect(delete_space_label)
	Signals.increase_score_label.connect(update_score)
	Signals.update_high_score_label.connect(update_highscore)
	if timer and Global.is_play():
		clear_start_screen()
	if Global.highscore >0:
		update_highscore()


# Called every frame. 'delta' is the elapsed time since the previous frame.
 
	
		
func delete_space_label():
	if not Global.is_idle():
		return
	Global.set_state_to_play()
	clear_start_screen()

func clear_start_screen():
	timer.queue_free()
	start_game_label.queue_free()

func _on_timer_timeout() -> void:
	start_game_label.visible = not start_game_label.visible

func update_score():
	score_label.text = "%04d" % Global.score

func update_highscore():
	high_score_label.text = "HI %04d" % Global.highscore
