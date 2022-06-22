
global.pause = false;
deactivated = false;

map_spr = spr_map_grid_160x160;
grid_square_width = 64;
map_darkness_offset = 0.1;
sunbox_ratio = 1;//number of squares on the map / global.sunbox_count;



menus[0, 0] = spr_button_menu_main;
menus[0, 1] = (global.view_width*global.window_scale)/2 - (sprite_get_width(spr_button_menu_main));
menus[0, 2] = 600;
menus[0, 3] = function() { room_goto(rm_level) };

