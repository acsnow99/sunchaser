/// @description sunlight ticks down - checks for light level to decrease

if (room != rm_level) {
	
	global.sunlight_current = 0;
	exit;
	
}

#region crash prevention
if (!vars_set || !sunbox_initiated) {
	
	if (instance_exists(obj_sunbox)) {
		
		sunbox_init();
		
		//change the light value of each sunbox
		sunbox_assign(global.sunlight_level);
		global.sunlight_current = global.sunbox[global.sunbox_current, 2];
		
		sunbox_initiated = true;
		
	}
	else {
		
		exit;
		
	}
	
	if (instance_exists(obj_player)) {
	
		player_pos_previous = obj_player.x; 
		global.sunbox_current = sunbox_seek(player_pos_previous);
		sunbox_previous = global.sunbox_current;
		
		vars_set = true;
		
	}
	else {
		
		exit;
		
	}
	
}
#endregion



//if (obj_player.x != obj_player.xprevious || obj_player.y != obj_player.yprevious) {
	
	//set the location of the player and use that location to set the displayed sunlight
	global.sunbox_current = sunbox_seek(obj_player.x, obj_player.y);
	global.sunlight_current = global.sunbox[global.sunbox_current, 2];
	
//}



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


if (global.sunlight_current >= global.nighttime_trigger) {
	
	if (!(global.item_equipped == 2)) {
		
		if (alarmvar_dmg <= 0) {
		
			with (obj_player) {
				
				damage_take(10);
				
			}
		
			alarmvar_dmg = alarmvar_dmg_default;
		
		}
	
		alarmvar_dmg -= global.dt_steady;
		
	}
	else {
		
		alarmvar_dmg = alarmvar_dmg_default;
		
	}
	
}




var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_sprite(back_id, colors[global.sunlight_current]);


alarmvar_sunset -= global.dt_steady;
