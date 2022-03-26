


if (!global.levels_initiated) {

	if instance_exists(obj_level_frame) {
	
		global.levels_initiated = levels_init();
		
	}
	
}

if (!spawners_initiated) {
	
	if instance_exists(obj_enemy_spawner) {
	
		spawners_initiated = enemy_spawner_init();
		
	}
	
}
