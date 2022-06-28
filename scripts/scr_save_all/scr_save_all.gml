// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_all(file){
	
	ini_open(global.save_file_path);
	
	ini_write_string(file, global.save_vars[0], global.save_file_name);
	ini_write_real(file, global.save_vars[1], global.savepoints[0]);
	ini_write_real(file, global.save_vars[2], -1);
	ini_write_real(file, global.save_vars[3], rm_level);
	
	ini_close();
	
	
	return true;

}