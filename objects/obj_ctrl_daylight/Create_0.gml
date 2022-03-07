///@description initialize variables

//where the highest light level is on the map(which sunbox is "lit")
global.sunlight_level = 4;
//the sunlight of where the player is
global.sunlight_current = 0;
//where the player is on the map(based on x axis, not y)
global.sunbox_current = 0;
//how many sunlight levels there are
global.sunbox_count = 0;

//sunlight_max is the highest index of sunlight that can exist
sunlight_min = 0;
sunlight_max = 7;
//how far the player can go from the "lit" box to still have the highest light level
sunlight_reach = 2;

sunset_spd_default = 2;
sunset_spd = sunset_spd_default;

alarmvar_sunset = sunset_spd;
alarmvar_sunset_previous = alarmvar_sunset;

alarmvar_dmg_default = 2;
alarmvar_dmg = alarmvar_dmg_default;



colors[0] = spr_background_0;
colors[1] = spr_background_1;
colors[2] = spr_background_2;
colors[3] = spr_background_3;
colors[4] = spr_background_4;
colors[5] = spr_background_5;
colors[6] = spr_background_6;
colors[7] = spr_background_7;



//based off of levels_init from obj_control_cam
sunbox_init = function() {
	
	global.sunbox_count = instance_number(obj_sunbox) - 1;

	for (var i = 0; i < global.sunbox_count; i++) {
	
		var _this_frame = instance_find(obj_sunbox, i);
	
		//mins and maxes for each level's camera reach
		global.sunbox[i, 0] = _this_frame.x;
		global.sunbox[i, 1] = global.sunbox[i, 0] + _this_frame.sprite_width;
		//light level in the sunbox
		global.sunbox[i, 2] = 0;
	
	
	}
	
	sunbox_initiated = true;

}


//based off level_seek in obj_ctrl_cam create event
sunbox_seek = function(_focusx) {
	
	for (var i = 0; i < global.sunbox_count; i++) {
		
		var _min_x = global.sunbox[i, 0];
		var _max_x = global.sunbox[i, 1];
		
		if (_focusx >= _min_x && _focusx <= _max_x) {
			
			global.sunbox_current = i;
			exit;
		
		}
		
	}
	
}



sunbox_assign = function(light) {
	
	/*
	switch(light) {
		
		//sunlight_min should be 0
		case sunlight_min:
			
			for (var i = 0; i < global.sunbox_count; i++) {

				global.sunbox[i, 2] = clamp(abs(global.sunlight_level - i - sunlight_reach), 0, sunlight_max);
				
			}
			
			//the far right sunbox's light level
			global.sunbox[i, 2] = sunlight_min + 1 - sunlight_reach;
			
			
			
		
	}
	*/
	
	for (var i = 0; i < global.sunbox_count; i++) {

		global.sunbox[i, 2] = clamp(abs(global.sunlight_level - i - sunlight_reach), 0, sunlight_max);
				
	}
	
	
}




//crash prevention
if (instance_exists(obj_player)) {
	
	player_pos_previous = obj_player.x; 
	sunbox_previous = global.sunbox_current;

	vars_set = true;
	
}
else {
	
	vars_set = false;
	
}

if (instance_exists(obj_sunbox)) {
	
	sunbox_init();
	
	sunbox_initiated = true;
	
}
else {
	
	sunbox_initiated = false;
	
}


