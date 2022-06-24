// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load(file, name, def){
	
	global.save_file = file;
	

	ini_open("savedata");
	
	return ini_read_real(file, name, def);
	
	ini_close();


}