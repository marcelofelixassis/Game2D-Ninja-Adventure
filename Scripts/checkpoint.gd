extends Area2D

func _ready():
	pass

func _on_checkpoint_body_entered(body: Node):
	if body.name == "Player":
		$anim.play("checked")
		body.hit_checkpoint()
		$collision.queue_free()
	
