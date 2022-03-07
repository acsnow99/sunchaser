
global.sunlight_current = 4;

sunbox_init();
sunbox_initiated = true;

if (instance_exists(obj_player)) {
	
	global.sunbox_current = sunbox_seek(obj_player.x, obj_player.y);
	
}
else {
	
	vars_set = false;
	
}

alarmvar_sunset = sunset_spd;
alarmvar_sunset_previous = alarmvar_sunset;

alarmvar_dmg = alarmvar_dmg_default;

