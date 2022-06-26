// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_all(file){
	
	ini_open("savedata");
	
	ini_write_real(file, global.save_vars[0], room);
	ini_write_real(file, global.save_vars[1], instance_nearest(obj_player.x, obj_player.y, obj_autosavepoint));
	ini_write_real(file, global.save_vars[2], -1);
	
	ini_close();
	
	
	return true;

}