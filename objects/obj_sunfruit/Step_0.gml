

depth = -y;

if (instance_exists(obj_player)) {
	
	if (place_meeting(x, y, obj_player) && health < global.health_max) {
		
		health += 10;
		instance_destroy();
		
	}
	
}

