
global.pause = false;
deactivated = false;

map_spr = spr_map_grid_160x160;
grid_square_width = 64;
map_darkness_offset = 0.1;
sunbox_ratio = 1;//number of squares on the map / global.sunbox_count;


menu = 0;

button_count[0] = 2;
button_count[1] = 3;

buttons[0, 0] = spr_button_menu_main;
buttons[0, 1] = (global.view_width*global.window_scale)/2 - (sprite_get_width(spr_button_menu_main)/2) - 200;
buttons[0, 2] = 500;
buttons[0, 3] = ev_user0;
buttons[1, 0] = spr_button_menu_main1;
buttons[1, 1] = (global.view_width*global.window_scale)/2 - (sprite_get_width(spr_button_menu_main1)/2) + 200;
buttons[1, 2] = 500;
buttons[1, 3] = ev_user1;


buttons_init_loadscreen = function() {
	
	menu = 1;
	
	buttons[0, 0] = spr_button_menu_load_empty;
	buttons[0, 1] = (global.view_width*global.window_scale)/2 - (sprite_get_width(buttons[0,0])/2);
	buttons[0, 2] = 100;
	buttons[0, 3] = ev_user0;
	buttons[1, 0] = spr_button_menu_load_empty;
	buttons[1, 1] = (global.view_width*global.window_scale)/2 - (sprite_get_width(buttons[1,0])/2);
	buttons[1, 2] = 300;
	buttons[1, 3] = ev_user0;
	buttons[2, 0] = spr_button_menu_load_empty;
	buttons[2, 1] = (global.view_width*global.window_scale)/2 - (sprite_get_width(buttons[2,0])/2);
	buttons[2, 2] = 500;
	buttons[2, 3] = ev_user0;
	
}

