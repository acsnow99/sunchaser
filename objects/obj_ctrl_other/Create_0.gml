
global.health_max = 50;
health = global.health_max;

global.level = 0;

global.debug = false;

global.pause = false;
deactivated = false;

global.alarmvar_runtime = 0;

//keeps track of how many hits the player has landed(0-2) 
// updated in player create event, movement_normal function in enemy create event
global.combo = 0;

map_spr = spr_map_grid_160x160;
grid_square_width = 16;
