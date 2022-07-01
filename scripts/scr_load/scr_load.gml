// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load(file){
	
	global.save_file = file;
	
	

	ini_open("savedata");
	
	
	var rm = ini_read_real(file, global.save_vars[3], rm_level);
	var savepnt = ini_read_real(file, global.save_vars[1], global.savepoints[0]);
	
	global.start_x = savepnt.x;
	global.start_y = savepnt.y;

	room_goto(rm);
	
	global.progress = ini_read_real(file, global.save_vars[2], -1);
	
	global.save_file_name = ini_read_string(file, global.save_vars[0], "New Game");

	
	ini_close();


}