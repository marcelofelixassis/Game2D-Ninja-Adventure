extends StaticBody2D

signal DoorClosed

func _ready():
	pass


func _on_Trigger_PlayerEntered():
	$anim.play("active")
