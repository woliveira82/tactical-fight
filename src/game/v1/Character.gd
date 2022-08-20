extends Node


var char_name = "Character"

var physical = 3
var agility = 3
var social = 3
var mental = 3

var max_health = 70
var health = 70


func setup_stats(new_name):
	char_name = new_name
	max_health = 70 + physical * 10
	health = max_health


func damage(damage):
	if damage < 0:
		return health

	health -= damage
	if health < 0:
		health = 0

	return health


func heal(heal):
	if heal < 0:
		return health

	health += heal
	if health > max_health:
		health = max_health

	return health
