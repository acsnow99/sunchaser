
if (alarmvar_anim <= 0) {
	
	animation_pos += 1;
	
	if (animation_pos > anim_end) {
		
		animation_pos = anim_begin
		
	}
	
	alarmvar_anim = alarmvar_frame_default;
	
}


draw_sprite_ext(spr_lightcrystal, animation_pos, x, y, 1, 1, 0, c_white, 1);


alarmvar_anim -= global.dt_steady;
