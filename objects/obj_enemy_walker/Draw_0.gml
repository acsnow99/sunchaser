/// @description

depth = -y;

// set the index to the current sunlight level(for color), offset by the length of the animation
image_index = global.sunlight_current * animation_length_current + animation_pos;

var mve_state = moving;
determine_sprite(mve_state);


draw_sprite_ext(spr_current, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha)
