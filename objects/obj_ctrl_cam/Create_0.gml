/// @description view setup - size
//See obj_camera in Eclipse files for more source code

//camera
global.view_width = 1080;
global.view_height = 720;
global.window_scale = 1;

window_set_size(global.view_width*global.window_scale, global.view_height*global.window_scale);
surface_resize(application_surface, global.view_width*global.window_scale, global.view_height*global.window_scale);
//display_set_gui_size(270, 180);
window_set_fullscreen(true);
camera_set_view_size(view_camera[0], global.view_width, global.view_height);



depth = -1;

height_healthbar = sprite_get_height(spr_healthbar);
width_meter = sprite_get_width(spr_lightboost_meter);
height_lightcrystal = sprite_get_width(spr_lightcrystal);


item_sprites[0] = spr_placeholder;
item_sprites[1] = spr_icon_sword;
item_sprites[2] = spr_icon_sun_lantern;


sprite_fx[2] = spr_glow;


