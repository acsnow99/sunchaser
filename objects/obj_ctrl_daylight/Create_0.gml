///@description initialize variables

sunlight_max = 4;
sunlight_min = -sunlight_max;
sunlight_current = sunlight_max;

sunset_spd_default = 5;
sunset_spd = sunset_spd_default;
//each sunlight level away from zero, this many seconds are pulled from the clock
sunset_spd_modifier = 1;

alarmvar_sunset = sunset_spd;
alarmvar_sunset_previous = alarmvar_sunset;

alarmvar_dmg_default = 4;
alarmvar_dmg = alarmvar_dmg_default;


//max amount of seconds that are added to the clock per second
max_secs_mod = 1.5;
//crash prevention
if (instance_exists(obj_player)) {
	
	player_pos_previous = obj_player.x; 
	seconds_per_pixel = 1/(obj_player.mve_spd / 2);
	vars_set = true;
	
}
else {
	
	vars_set = false;
	
}

