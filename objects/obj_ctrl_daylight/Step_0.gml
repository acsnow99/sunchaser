/// @description sunlight ticks down - checks for light level to decrease



//crash prevention
if (!vars_set) {
	
	if (instance_exists(obj_player)) {
	
		player_pos_previous = obj_player.x; 
		lvl_previous = global.level;
		
		vars_set = true;
		
	}
	else {
		
		exit;
		
	}
	
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


if (lvl_previous != global.level) { 
	
	if (obj_player.x < player_pos_previous) {
		
		if (global.sunlight_current > sunlight_min) {
			
			// update sunlight
			global.sunlight_current -= 1;
			 
		}
		
		// new level
		player_pos_previous = obj_player.x;
		lvl_previous = global.level; 
		
		// give the player a little extra time
		alarmvar_sunset += sunlight_mod_lvlup;
		
		// block the player from returning
		var _x = global.levels[global.level, 1] + 19;
		var _y = room_height / 2;
		instance_create_layer(_x, _y, "Instances", obj_obstacle_backtrackblocker);
		
	}
	
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

var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_sprite(back_id, colors[global.sunlight_current]);


alarmvar_sunset -= global.dt_steady;
