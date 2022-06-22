extends enemyBase

func _ready():
	set_physics_process(false)

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	_set_animation()

func _on_ArenaDoor2_DoorClosed():
	set_physics_process(true)
