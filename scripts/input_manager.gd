extends Node


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") or (event is InputEventScreenTouch and event.pressed):
		Signals.space_is_pressed.emit()
