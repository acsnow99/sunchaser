/// @description Object controls camera
//See obj_camera in Eclipse files for more source code

//camera
global.view_width = 1366/2;
global.view_height = 768/2;
global.window_scale = 4;

//window_set_size(global.view_width*global.window_scale, global.view_height*global.window_scale);
//surface_resize(application_surface, global.view_width*global.window_scale, global.view_height*global.window_scale);
window_set_fullscreen(true);


//default camera limits
max_x = room_width;
max_y = room_height;
min_x = 0;
min_y = 0;

//object on which to focus the camera
focus_obj = obj_player;
focus_quick = false;


