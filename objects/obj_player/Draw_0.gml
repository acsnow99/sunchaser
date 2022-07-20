
//anim_update_draw();

var sprite = anim_frame_start[dir_last, animation_current] + animation_pos;



if (alarmvar_anim_update <= 0) {
	
	if (sprite < (anim_frame_end[dir_last, animation_current])) {
		
		animation_pos++;
		
	}
	else if (!anim_stop[animation_current]) {
	
		animation_pos = 0;
		
	}
	
	
	alarmvar_anim_update = alarmvar_anim_update_default;
	
}
alarmvar_anim_update -= global.dt_steady;



//set index with updated animation_pos value
sprite = anim_frame_start[dir_last, animation_current] + animation_pos;
image_index = sprite;


//function ghost_frame_check also sets the alpha based on ghost frames
alarmvar_ghost_frame = ghost_frame_check(alarmvar_inv, alarmvar_ghost_frame, alarmvar_ghost_frame_default);

depth = -y;



draw_sprite_ext(spr_current, image_index, x, y, image_xscale, image_yscale, 0, draw_color, image_alpha);
