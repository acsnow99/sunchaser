
global.sunlight_current = 4;

sunbox_init();
sunbox_initiated = true;

if (instance_exists(obj_player)) {
	
	player_pos_previous = obj_player.x; 
	global.sunbox_current = sunbox_seek(player_pos_previous);
	sunbox_previous = global.sunbox_current;
	
	//change the light value of each sunbox
	sunbox_assign(global.sunlight_level);
	global.sunlight_current = global.sunbox[global.sunbox_current, 2];
	
}
else {
	
	vars_set = false;
	
}

alarmvar_sunset = sunset_spd;
alarmvar_sunset_previous = alarmvar_sunset;

alarmvar_dmg = alarmvar_dmg_default;

