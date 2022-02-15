/// @description sunlight ticks down - checks for light level to decrease



//crash prevention
if (!vars_set) {
	
	if (instance_exists(obj_player)) {
	
		player_pos_previous = obj_player.x; 
		seconds_per_pixel = 1/(obj_player.mve_spd / 2);
		vars_set = true;
		
	}
	
}





var _x;
if (instance_exists(obj_player)) {
	
	_x = obj_player.x;
	
}
var _dx = _x - player_pos_previous;

var _lighten = alarmvar_sunset > alarmvar_sunset_previous;
var _darken = alarmvar_sunset <= 0;

if (_lighten || _darken) {
	
	if (_lighten && sunlight_current < sunlight_max) {
		
		sunlight_current += 1;
		
	}
	
	if (_darken && sunlight_current > sunlight_min) {
		
		sunlight_current -= 1;
		
	}
	
	var _mod = sunset_spd_modifier * abs(abs(sunlight_current) - 4);
	
	alarmvar_sunset = sunset_spd - _mod;
	alarmvar_sunset_previous = alarmvar_sunset;
	
}



if (sunlight_current <= 0) {
	
	if (alarmvar_dmg <= 0) {
		
		var _d = abs(sunlight_current - 4) - 4
		var _mod_d = clamp(_d, 0, 4);
		
		health -= 10;
		alarmvar_dmg = alarmvar_dmg_default - _mod_d;
		
	}
	
	alarmvar_dmg -= global.dt_steady;
	
}



player_pos_previous = _x;

//distance moved by player modified by the seconds gained per pixel moved
alarmvar_sunset -= clamp(_dx * seconds_per_pixel, -global.dt_steady * max_secs_mod, 0);
alarmvar_sunset -= global.dt_steady;
