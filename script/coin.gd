extends Area2D

@onready var game_manage: Node = %GameManage
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	game_manage.add_point()
	animation_player.play("pick")
