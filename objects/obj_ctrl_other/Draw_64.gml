

if (global.pause) {
	
	var _l = global.sunlight_current;
	draw_sprite_ext(spr_background_map, _l, 0, 0, global.view_width, global.view_height, 0, c_white, 1);
	
	
	var o = 0;
	
	for (var i = 0; i < global.sunbox_count; i++) {
	
		var far_l = 0;
		var far_r = global.sunbox_count;
		
		var l = light - i;
		var r = light + i;
		
		
		if (l < far_l) {
			
			l = far_r + l + 1;
			
		}
		
		if (r > far_r) {
			
			r = far_l + (r - far_r - 1);
			
		}
		
		
		
		global.sunbox[l, 2] = clamp(i - sunlight_reach, 0, sunlight_max);
		global.sunbox[r, 2] = clamp(i - sunlight_reach, 0, sunlight_max);
		
		
		
		//if the two sunboxes being assigned are right next to each other, end the function
		if ((l <= r && l >= (r-1)) || (l == far_l && r == far_r)) {
			
			o++;
			
			if (o > 1) {
				exit;
			}
			
		}
		
		draw_sprite_ext(spr_moon, _s, _x, _y, 1, 1, 0, c_white, 1);
	
	
	}
	
	
	
	draw_sprite(spr_map_grid_160x160, 0, global.view_width/2, global.view_height/2);
	
}

