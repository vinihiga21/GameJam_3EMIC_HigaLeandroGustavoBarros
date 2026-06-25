extends CharacterBody2D


const SPEED = 900.0
const JUMP_VELOCITY = -400.0

@onready var wall_detector := $wall_detector as RayCast2D
var direction := -1

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta

	if wall_detector.is_colliding():
		direction *= -1
		wall_detector.scale.x *+-1



	velocity.x = direction * SPEED * delta

	move_and_slide()


func _on_hitbox_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
