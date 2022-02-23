
//set hb position to "follow" player
x = obj_player.x + x_rel;
y = obj_player.y + y_rel;

//always appear under the player
depth = obj_player.depth + 1;
