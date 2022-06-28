// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_string(file, variable, def){
	
	ini_open(global.save_file_path);
	
	
	return ini_read_string(file, variable, def);

	
	ini_close();


}