extends Control

@onready var coins_counter = $Container/CoinsContainer/CoinsCounter
@onready var timer_counter = $Container/TimerContainer/TimerCounter
@onready var score_counter = $Container/ScoreContainer/ScoreCounter
@onready var timer: Timer = $Timer


var minutes = 0
var seconds = 0

@export_range (0,5) var default_minutes := 0
@export_range (0,59) var default_seconds := 0

signal time_is_up()
func _ready():
	coins_counter.text = str("%04d" % Global.coins)

	timer_counter.text = str("%02d" % Global.minutes) + ":" + str("%02d" % Global.seconds)
	minutes = Global.minutes
	seconds = Global.seconds

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	coins_counter.text = str("%04d" %Global.coins)

	if minutes == 0 and seconds == 0:
		emit_signal("time_is_up")

func _on_timer_timeout() -> void:
	seconds += 1

	if seconds >= 60:
		seconds = 0
		minutes += 1

	Global.minutes = minutes
	Global.seconds = seconds
	timer_counter.text = str("%02d" % minutes) + ":" + str("%02d" % seconds)
func reset_timer():
	minutes = default_minutes
	seconds = default_seconds
