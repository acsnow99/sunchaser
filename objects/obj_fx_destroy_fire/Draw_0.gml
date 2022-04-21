

if (alarmvar_anim_update <= 0) {
	
	animation_pos += 1;
	if (animation_pos >= animation_length_current) {
		
		instance_destroy();
		
	}
	
	alarmvar_anim_update = alarmvar_anim_update_default;

}

image_index = global.sunlight_current * animation_length_current + animation_pos;


depth = -y;

draw_sprite_ext(spr_current, image_index, x, y, image_xscale, image_yscale, 0, draw_color, image_alpha);


alarmvar_anim_update -= global.dt_steady;
