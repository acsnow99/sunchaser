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



