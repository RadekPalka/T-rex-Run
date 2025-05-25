extends  Node
enum State {
	IDLE,
	PLAY,
	DEAD
}

var current_state = State.IDLE
const BASE_GAME_SPEED = 400.0
var game_speed = BASE_GAME_SPEED
var score =0
var highscore =0
func set_state_to_play():
	score = 0 
	current_state = State.PLAY

func set_state_to_dead():
	current_state = State.DEAD

func is_idle():
	return current_state == State.IDLE

func is_play():
	return current_state == State.PLAY

func is_dead():
	return current_state == State.DEAD

func _ready() -> void:
	Signals.game_over.connect(set_state_to_dead)
