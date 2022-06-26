
global.pause = false;
deactivated = false;

map_spr = spr_map_grid_160x160;
grid_square_width = 64;
map_darkness_offset = 0.1;
sunbox_ratio = 1;//number of squares on the map / global.sunbox_count;


menu = 0;



/*
textbox_width = sprite_get_width(spr_textbox);
textbox_height = sprite_get_height(spr_textbox);
textbox_x = (global.view_width/2) - (textbox_width/2);
textbox_y = global.view_height - textbox_height;

var _xbuffer = 12;
var _ybuffer = 8;
text_x = textbox_x + _xbuffer;
text_y = textbox_y + _ybuffer;

text_max_width = (textbox_width) - (_xbuffer * 2);
*/



button_count[0] = 2;
button_count[1] = 3;

buttons[0, 0] = spr_button_menu_main;
buttons[0, 1] = (global.view_width*global.window_scale)/2 - (sprite_get_width(spr_button_menu_main)/2) - 200;
buttons[0, 2] = 400;
buttons[0, 3] = ev_user0;
buttons[1, 0] = spr_button_menu_main1;
buttons[1, 1] = (global.view_width*global.window_scale)/2 - (sprite_get_width(spr_button_menu_main1)/2) + 200;
buttons[1, 2] = 400;
buttons[1, 3] = ev_user1;


text_count[0] = 1;
text_count[1] = 0;

text[0, 0] = "Start Game"
text[0, 1] = buttons[0, 1] + sprite_get_width(buttons[0, 0])/2;
text[0, 2] = buttons[0, 2] + sprite_get_height(buttons[0, 0])/2;


buttons_init_loadscreen = function() {
	
	menu = 1;
	
	buttons[0, 0] = spr_button_menu_load_empty;
	buttons[0, 1] = (global.view_width*global.window_scale)/2 - (sprite_get_width(buttons[0,0])/2);
	buttons[0, 2] = 100;
	buttons[0, 3] = ev_user2;
	buttons[1, 0] = spr_button_menu_load_empty;
	buttons[1, 1] = (global.view_width*global.window_scale)/2 - (sprite_get_width(buttons[1,0])/2);
	buttons[1, 2] = 300;
	buttons[1, 3] = ev_user3;
	buttons[2, 0] = spr_button_menu_load_empty;
	buttons[2, 1] = (global.view_width*global.window_scale)/2 - (sprite_get_width(buttons[2,0])/2);
	buttons[2, 2] = 500;
	buttons[2, 3] = ev_user4;
	
}


