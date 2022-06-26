
if (title) {
	
	
	draw_sprite(spr_title_background, 0, 0, 0); 
	
	
#region draw buttons
	
	var mse_hover = false;
	
	for (var i = 0; i < button_count[menu]; i++) {
	
		var sprite = buttons[i,0];
	
		var _x1 = buttons[i,1];
		var _y1 = buttons[i,2];
		var _x2 = _x1 + sprite_get_width(sprite);
		var _y2 = _y1 + sprite_get_height(sprite);
		
		var b_subimg = 0;
	
	
		var _xm = device_mouse_x_to_gui(0);
		var _ym = device_mouse_y_to_gui(0);
	
	
		if (point_in_rectangle(_xm, _ym, _x1, _y1, _x2, _y2)) {
			
			mse_hover = true;
			
			//when cursor is over button, change both their images to the second frame of the sprite
			b_subimg = 1;
		
		
			if (mouse_check_button_pressed(mb_left)) {
			
				event_perform(ev_other, buttons[i,3]);
				exit;
			
			}
		
		}
		
		
		draw_sprite(sprite, b_subimg, _x1, _y1);
		
	}
		
#endregion
		
		
#region draw text
		
	for (var i = 0; i < text_count[menu]; i++) {
	

		draw_text(text[i, 1], text[i, 2], text[i, 0]);
		
		
	}
	
#endregion
	
	
	draw_sprite(spr_cursor_menu, mse_hover, _xm, _ym); 
	
}



if (global.pause) {
	
	var _l = global.sunlight_current;
	draw_sprite_ext(spr_background_map, _l, 0, 0, global.view_width, global.view_height, 0, c_white, 1);
	
	draw_sprite(spr_map_grid_160x160, 0, global.view_width/2, global.view_height/2);
	
	
	var inc = grid_square_width * sunbox_ratio;
	//middle of the room, to the left edge of the map, offset by the sprite size
	var left = (global.view_width / 2) - (sprite_get_width(map_spr) / 2);
	var top = (global.view_height / 2) - (sprite_get_height(map_spr) / 2);
	
	for (var i = 0; i <= global.sunbox_count; i++) {

		var _x = i * inc + left;
		var _x2 = (i + 1) * inc + left;
		var _y = top;
		var _y2 = _y + sprite_get_height(map_spr) - 1;
		var light = global.sunbox[i, 2];
		var alph = light/global.sunlight_max - map_darkness_offset;
		
		draw_set_color(c_black);
		draw_set_alpha(alph);
		draw_rectangle(_x, _y, _x2, _y2, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
		
		
	}
	
	
	var l = global.level;
	var w = sprite_get_width(spr_level);
	var h = sprite_get_height(spr_level);
	var _x = global.levels[l, 0]/w * grid_square_width + left;
	var _y = global.levels[l, 2]/h * grid_square_width + top;
	
	draw_sprite_ext(spr_map_locator, image_index, _x, _y, 1, 1, 0, c_white, 1);
	
}

