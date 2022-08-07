extends Control


const ATK_CHANCE: float = 0.8
const DFS_CHANCE: float = 0.2
const BASE_DAMAGE: int = 10

var player = GameData.player
var enemy = GameData.enemy
var rng = GameData.rng


func _ready():
	$VBoxPlayer.set_fighter(player)
	$VBoxEnemy.set_fighter(player)


func _attack(attacker, defender):
	var resume = '%s > %s: ' % [attacker['name'], defender['name']]
	if rng.randf() < ATK_CHANCE + (attacker['attr']['agility'] / 100.0):
		var damage = attacker['attr']['physical'] + rng.randi_range(1, 10)
		defender['stats']['health'] -= damage
		resume += 'Hit %d' % damage
	
	else:
		resume += 'Miss'

	_show_results(resume)


func _show_results(text):
	$RichTextLabel.text = text + '\n' + $RichTextLabel.text


func _on_AttackButton_button_up():
	_attack(player, enemy)
