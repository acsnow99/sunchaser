
if (alarmvar_shoot <= 0) {
	
	mve_dir = point_direction(x, y, obj_player.x, obj_player.y);
	mve_spd = mve_spd_default;
	
	if (alarmvar_destroy <= 0) {
		
		die();
		
	}
	
	alarmvar_destroy -= global.dt_steady;
	
}

var spd = mve_spd * global.dt_steady;
mve_simple(spd, mve_dir);


if (place_meeting(x, y, obj_player)) {
	
	die();
	
}


alarmvar_shoot -= global.dt_steady;

