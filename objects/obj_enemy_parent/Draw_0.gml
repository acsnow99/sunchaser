/// @description set color to red; alpha based on current health

depth = -y;

image_alpha = health_max / health_current;

draw_sprite_ext(spr_player_idle_lr, image_index, x, y, 1, 1, 0, c_purple, image_alpha)
