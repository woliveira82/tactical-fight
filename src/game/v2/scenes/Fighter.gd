extends Sprite


var physical = 3
var agility = 3
var mentality = 3
var espirit = 3

var max_health = 70
var health = 70

onready var rng = RandomNumberGenerator.new()


func _ready():
	rng.randomize()
	$DamageLabel.visible = false
	$MissLabel.visible = false
	_update_stats()


func _update_stats():
	max_health = 70 + (10 * physical)
	health = max_health
	update_scene()


func update_scene():
	$Health/Label.text = "%d / %d" % [health, max_health]
	var new_size = float(health) / float(max_health) * $Health/Label.rect_size.x
	$Health/Label/HealthBar.rect_size.x = new_size


func damage(value: int):
	health = max(health - value, 0)
	$DamageLabel.text = str(value)
	update_scene()
	$AnimationPlayer.play("Hit")


func miss():
	$AnimationPlayer.play("Miss")


func attack(target):
	var precision = 60 + (agility - target.agility) * 3
	precision = min(max(precision, 5), 95)
	var result = precision - rng.randi_range(1, 100)
	if result >= 0:
		var margin = int(result / 5)
		var diff_phy = physical - target.physical
		var damage = rng.randi_range(5, 10) + diff_phy
		damage = min(damage, 1) + margin
		target.damage(damage)
	
	else:
		target.miss()
