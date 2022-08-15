extends VBoxContainer

var fighter


func set_fighter(new_fighter):
	fighter = new_fighter
	update_stats()
	update_health()


func update_stats():
	$NameLabel.text = fighter.char_name
	$Physical/ValueLabel.text = str(fighter.physical)
	$Agility/ValueLabel.text = str(fighter.agility)
	$Social/ValueLabel.text = str(fighter.social)
	$Mental/ValueLabel.text = str(fighter.mental)


func update_health():
	$Label.text = "%d / %d" % [fighter.health, fighter.max_health]
	$Label/HealthColorRect.rect_size.y = 15
	var max_size = $Label.rect_size.x * 0.8
	var new_size = float(fighter.health) / float(fighter.max_health) * max_size
	$Label/HealthColorRect.rect_size.x = new_size
