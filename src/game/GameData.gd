extends Node


var player = {
	"name": "Player",
	"attr": {
		"physical": 3,
		"agility": 3,
		"social": 3,
		"mental": 3,
	},
	"stats": {
		"max_health": 70,
		"health": 70,
	}
}

var enemy = {
	"name": "Enemy",
	"attr": {
		"physical": 3,
		"agility": 3,
		"social": 3,
		"mental": 3,
	},
	"stats": {
		"max_health": 70,
		"health": 70,
	}
}

var rng = RandomNumberGenerator.new()


func _ready():
	rng.randomize()
	_update_stats(player)
	_update_stats(enemy)


func _update_stats(fighter):
	fighter["stats"]["max_health"] = 70 + 10 * fighter["attr"]["physical"]
	fighter["stats"]["health"] = fighter["stats"]["max_health"]
