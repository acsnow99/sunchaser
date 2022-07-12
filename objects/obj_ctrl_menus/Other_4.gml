
//variable used also in draw gui event
title = room == rm_title;
setup = room == rm_setup;

if (!loaded && !title && !setup) {
	
	loaded = scr_load(global.save_file);
	
}
