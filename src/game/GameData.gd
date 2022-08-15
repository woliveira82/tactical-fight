extends Node

var rng = RandomNumberGenerator.new()

onready var player = $Player
onready var enemy = $Enemy

const ATK_CHANCE: float = 0.8
const DFS_CHANCE: float = 0.2
const BASE_DAMAGE: int = 10


func _ready():
	rng.randomize()
	player.setup_stats('Player')
	enemy.setup_stats('Enemy')


func attack(attacker, defender):
	var agi_diference = (attacker.agility - defender.agility) / 100
	if rng.randf() < (ATK_CHANCE + agi_diference):
		var phy_diference = attacker.physical - defender.physical
		var damage = phy_diference + rng.randi_range(5, 10)
		damage = 1 if damage < 1 else damage
		defender.damage(damage)
		return damage
	
	return 0
