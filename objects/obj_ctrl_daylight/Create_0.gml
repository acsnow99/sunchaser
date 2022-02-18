///@description initialize variables

sunlight_max = 7;
sunlight_min = 0;
global.sunlight_current = sunlight_min;

sunset_spd_default = 5;
sunset_spd = sunset_spd_default;
// for future use: each sunlight level away from zero, this many seconds are pulled from the clock
//sunset_spd_modifier = 2;
// how much extra time you get every time you pass a room
sunlight_mod_lvlup = 3;

alarmvar_sunset = sunset_spd;
alarmvar_sunset_previous = alarmvar_sunset;

alarmvar_dmg_default = 4;
alarmvar_dmg = alarmvar_dmg_default;


//crash prevention
if (instance_exists(obj_player)) {
	
	player_pos_previous = obj_player.x; 
	lvl_previous = global.level;

	vars_set = true;
	
}
else {
	
	vars_set = false;
	
}

