

if (!global.levels_initiated && instance_exists(obj_level_frame)) {
	
	global.levels_initiated = levels_init();
	
}

if (!spawners_initiated && instance_exists(obj_enemy_spawner)) {
	
	spawners_initiated = enemy_spawner_init();
	
}


//the room has just started
room_start = true;

