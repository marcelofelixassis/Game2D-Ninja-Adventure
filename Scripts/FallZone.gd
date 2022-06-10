extends Area2D

func _on_fallzone_body_entered(body):
	if(body.name == "Player"):
		Global.is_dead = true
		if get_tree().change_scene("res://Prefabs/GameOver.tscn") != OK:
			print("error")
