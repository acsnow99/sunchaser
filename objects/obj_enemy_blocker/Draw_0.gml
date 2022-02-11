/// @description set color to red; alpha based on current health

depth = -y;

image_alpha = health_max / health_current;


var mve_state = moving;
determine_sprite(mve_state);


draw_sprite_ext(spr_current, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha)
