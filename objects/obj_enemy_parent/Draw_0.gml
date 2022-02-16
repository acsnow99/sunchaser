
depth = -y;

image_index = global.sunlight_current * sunlight_mod;
image_alpha = health_max / health_current;

draw_sprite_ext(spr_player_idle_lr, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha)
