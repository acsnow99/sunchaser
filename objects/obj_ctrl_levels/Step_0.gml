

#region crash prevention

if (!instance_exists(obj_player)) {
	
	exit;
	
}

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

#endregion


var _focusx = obj_player.x;
var _focusy = obj_player.y;


//	check which level the player is in if they are moving
if (room_start || obj_player.x != obj_player.xprevious || obj_player.y != obj_player.yprevious) {
	
	global.level = clamp(level_seek(_focusx, _focusy), 0, global.level_count);
	
	if(lvl_previous != global.level) {
		
		enemy_cleanup();
		enemy_spawn();
		
	}
	
	//updates(stops this code from running constantly with room_start)
	room_start = false;
	lvl_previous = global.level;
	
}


//checks if the player is in an edge-of-world teleport point - then teleports them
check_outside_room();


