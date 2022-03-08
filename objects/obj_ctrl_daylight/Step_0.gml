/// @description sunlight ticks down - checks for light level to decrease

if (room == rm_end || room == rm_setup) {
	
	exit;
	
}

//crash prevention
if (!vars_set || !sunbox_initiated) {
	
	if (instance_exists(obj_player)) {
	
		player_pos_previous = obj_player.x; 
		sunbox_seek(player_pos_previous);
		sunbox_previous = global.sunbox_current;
		
		vars_set = true;
		
	}
	else {
		
		exit;
		
	}
	
	if (instance_exists(obj_sunbox)) {
		
		sunbox_init();
		sunbox_initiated = true;
		
	}
	else {
		
		exit;
		
	}
	
}


if (obj_player.x != obj_player.xprevious || obj_player.y != obj_player.yprevious) {
	
	sunbox_seek(obj_player.x, obj_player.y);
	global.sunlight_current = global.sunbox[global.sunbox_current, 2];
	
}


//SET SUNLIGHT LEVEL
/*
if (global.sunbox_current < global.sunlight_level && global.sunbox_current > (global.sunlight_level - sunlight_reach)) {
	
	global.sunlight_current = 0;
	
}*/



var _darken = alarmvar_sunset <= 0;

if (_darken) {
	
	if (global.sunlight_level > sunlight_min) {
		
		global.sunlight_level -= 1;
		
	}
	else {
		
		global.sunlight_level = global.sunbox_count;
		
	}
	
	// may implement modifier to sunset speed later
	//var _mod = sunset_spd_modifier * abs(global.sunlight_current - 7);
	
	//change the light value of each sunbox
	sunbox_assign(global.sunlight_level);
	global.sunlight_current = global.sunbox[global.sunbox_current, 2];
	
	// would use mod to subtract from sunset_spd
	alarmvar_sunset = sunset_spd;
	alarmvar_sunset_previous = alarmvar_sunset;
	
}


/*
if (sunbox_previous != global.sunbox_current) { 
	
	
	//player has moved towards the sun, extending their time if they:
	// -moved into a new sunbox
	// -is in a sunbox that is to the left of the previous level
	// and vice versa
	if (obj_player.x < player_pos_previous) {
		
		if (global.sunlight_current > sunlight_min) {
			
			// update sunlight
			global.sunlight_current--;
			 
		}
		
		
		// block the player from returning
		var _x = global.levels[global.level, 1] + 19;
		var _y = room_height / 2;
		instance_create_layer(_x, _y, "Instances", obj_obstacle_backtrackblocker);
		
		
		
		// new sunbox
		player_pos_previous = obj_player.x;
		sunbox_previous = global.sunbox_current; 
		
		
		
		// give the player a little extra time
		alarmvar_sunset = clamp(alarmvar_sunset + sunlight_mod_lvlup, sunset_spd, sunset_spd + sunlight_mod_lvlup);
		
		
	}
	
	
}  


if (global.combo >= 3 && global.sunlight_current > 0) {
	
	global.sunlight_current -= 1;
	
	global.combo = 0;
	
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
*/

var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_sprite(back_id, colors[global.sunlight_current]);


alarmvar_sunset -= global.dt_steady;
