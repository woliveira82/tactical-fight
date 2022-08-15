extends Control


const ATK_CHANCE: float = 0.8
const DFS_CHANCE: float = 0.2
const BASE_DAMAGE: int = 10

var player = GameData.player
var enemy = GameData.enemy
var rng = GameData.rng


func _ready():
	$VBoxPlayer.set_fighter(player)
	$VBoxEnemy.set_fighter(enemy)


func _show_results(attacker_name, defender_name, damage):
	var final_result = '%s > %s: ' % [attacker_name, defender_name]
	if damage == 0:
		final_result += 'Miss'
	
	else:
		final_result += 'Hit %d' % damage
	
	$RichTextLabel.text = final_result + '\n' + $RichTextLabel.text


func _on_AttackButton_button_up():
	var damage = GameData.attack(player, enemy)
	_show_results(player.char_name, enemy.char_name, damage)
	$VBoxEnemy.update_health()


func _update_health(new_health):
	pass


