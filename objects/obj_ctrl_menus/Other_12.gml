
var rm = scr_load(0, global.save_vars[0], rm_level);
var savepnt = scr_load(0, global.save_vars[1], global.savepoints[0]);


global.start_x = savepnt.x;
global.start_y = savepnt.y;


room_goto(rm);


