
var lvl = scr_lvl_check(x, y);

if (lvl != global.level || triggered) {
	
	exit;

}


var triggd = place_meeting(x, y, obj_player);

if (triggd) {
	
	obj_ctrl_cutscene.cutscene_start(scene, act); 
	
	triggered = true;
	
}

