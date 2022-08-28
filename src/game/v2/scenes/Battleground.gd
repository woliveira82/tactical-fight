extends Control

onready var player = $Player
onready var enemy = $Enemy


func _on_AttackButton_button_up():
	player.attack(enemy)
	$Actions.visible = false
	$Timer.start(1.0)


func _enemy_turn():
	enemy.attack(player)
	$Actions.visible = true


func _on_Timer_timeout():
	_enemy_turn()
