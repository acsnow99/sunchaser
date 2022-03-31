

if (global.debug) {
	
	if (instance_exists(obj_player)) {
		
		draw_set_color(c_yellow);
		draw_rectangle(obj_player.bbox_left, obj_player.bbox_top, obj_player.bbox_right, obj_player.bbox_bottom, false);
		draw_set_color(c_white);
		
	}
	
	/*
	if (instance_exists(obj_enemy_parent)) {
		
		var o = 0;
	
		for (var i = 0; i <= instance_number(obj_enemy_parent); i++) {
		
			o = instance_find(obj_enemy_parent, i);
		
			draw_set_color(c_purple);
			draw_rectangle(o.bbox_left, o.bbox_top, o.bbox_right, o.bbox_bottom, false);
			draw_set_color(c_white);
		
		}
	}*/
	
}