// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//@arg0 file
function scr_save_string(file, name, val){

	ini_open(global.save_file_path);
		
	ini_write_string(file, name, val);
	
	ini_close();



	return true;

}