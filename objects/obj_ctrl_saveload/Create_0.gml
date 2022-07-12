
global.save_file_path = "savedata";

//name that the player chooses for their character
global.save_file_name = "New Game";

global.save_vars[0] = "savename";
global.save_vars[1] = "savepoint";
global.save_vars[2] = "progress";
global.save_vars[3] = "room";
global.save_vars[4] = "sunlight";

//current set of save data being used
global.save_file = -1;

save_file_count =  3;

autosaved = false;

//Whether the game starts with a new blank save file or keeps the existing one
overwrite = false;


//saves the ID of the starting spawn point
global.savepoints[0] = inst_savepoint_start;

