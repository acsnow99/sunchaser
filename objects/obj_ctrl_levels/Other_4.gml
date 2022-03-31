
global.levels_initiated = false;
spawners_initiated = false;

if (instance_exists(obj_level_frame)) {
	
	global.levels_initiated = levels_init();
	
}

if (instance_exists(obj_enemy_spawner)) {
	
	spawners_initiated = enemy_spawner_init();
	
}


//the room has just started
room_start = true;

