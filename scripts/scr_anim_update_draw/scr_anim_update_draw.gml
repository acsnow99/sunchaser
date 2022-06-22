//updates "ghost frame" animation, sorts depth, and draws the correct frame of the sprite
function anim_update_draw(){

	var sprite = dir_last;

	//set the index to the current sunlight level(for color), offset by the length of the animation
	image_index = /*global.sunlight_current * animation_length_current +*/ (colors_count * sprite) + animation_pos;


	alarmvar_ghost_frame = ghost_frame_check(alarmvar_inv, alarmvar_ghost_frame, alarmvar_ghost_frame_default);

	depth = -y;

	draw_sprite_ext(spr_current, image_index, x, y, image_xscale, image_yscale, 0, draw_color, image_alpha);


}