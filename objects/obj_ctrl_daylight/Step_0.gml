/// @description sunlight ticks down - checks for light level to decrease



//crash prevention
if (!vars_set) {
	
	if (instance_exists(obj_player)) {
	
		player_pos_previous = obj_player.x; 
		
		vars_set = true;
		
	}
	
}





var _x = 0;
if (instance_exists(obj_player)) {
	
	_x = obj_player.x;
	
}



var _darken = alarmvar_sunset <= 0;

if (_darken) {
	
	if (global.sunlight_current < sunlight_max) {
		
		global.sunlight_current += 1;
		
	}
	
	// may implement modifier to sunset speed later
	//var _mod = sunset_spd_modifier * abs(global.sunlight_current - 7);
	
	// would use mod to subtract from sunset_spd
	alarmvar_sunset = sunset_spd;
	alarmvar_sunset_previous = alarmvar_sunset;
	
}



if (global.sunlight_current >= 4) {
	
	if (alarmvar_dmg <= 0) {
		
		var _d = abs(global.sunlight_current - 4) - 4
		var _mod_d = clamp(_d, 0, 4);
		
		health -= 10;
		alarmvar_dmg = alarmvar_dmg_default - _mod_d;
		
	}
	
	alarmvar_dmg -= global.dt_steady;
	
}



player_pos_previous = _x;

alarmvar_sunset -= global.dt_steady;
