
if (global.debug) {
	
	draw_set_alpha(0.25);
	draw_set_color(c_purple);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	draw_set_alpha(1);
	draw_set_color(c_white);

}

draw_sprite_ext(spr_current, image_index, x, y, 1, 1, image_angle, c_white, 1);
