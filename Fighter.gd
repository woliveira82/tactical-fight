extends VBoxContainer

var fighter_name = "PLAYER"
var physical = 3
var agility = 3
var social = 3
var mental = 3

var health = 70
var current_health = health


func _ready():
	health = 70 + (10 * physical)
	current_health = health
	_update_label()


func _update_label():
	$NameLabel.text = fighter_name
	$Physical/ValueLabel.text = str(physical)
	$Agility/ValueLabel.text = str(agility)
	$Social/ValueLabel.text = str(social)
	$Mental/ValueLabel.text = str(mental)
	
	$Label.text = "%d / %d" % [current_health, health]
	$Label/HealthColorRect.rect_size.y = 15
	$Label/HealthColorRect.rect_size.x = (
		current_health / health * $Label.rect_size.x * 0.8
	)
