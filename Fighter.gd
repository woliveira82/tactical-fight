extends VBoxContainer


func set_fighter(fighter_data):
	$NameLabel.text = fighter_data["name"]
	_update_attributes(fighter_data["attr"])
	_update_stats(fighter_data["stats"])


func _update_attributes(attributes_data):
	$Physical/ValueLabel.text = str(attributes_data["physical"])
	$Agility/ValueLabel.text = str(attributes_data["agility"])
	$Social/ValueLabel.text = str(attributes_data["social"])
	$Mental/ValueLabel.text = str(attributes_data["mental"])


func _update_stats(stats_data):
	$Label.text = "%d / %d" % [stats_data["health"], stats_data["max_health"]]
	$Label/HealthColorRect.rect_size.y = 15
	$Label/HealthColorRect.rect_size.x = (
		stats_data["health"] / stats_data["max_health"] * $Label.rect_size.x * 0.8
	)
