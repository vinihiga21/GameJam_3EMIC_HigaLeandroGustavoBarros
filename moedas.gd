extends Area2D

var coins := 1
var collected := false

@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	Global.coins = 0

func _on_body_entered(body: Node2D) -> void:
	if collected:
		return

	collected = true
	Global.coins += coins
	print(Global.coins)

	animated_sprite_2d.play("colect")

	set_deferred("monitoring", false)
