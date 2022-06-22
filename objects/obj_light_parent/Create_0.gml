
/// @description Variables


lit = true;

//how strong the light is(uses alpha value, so 0-1, representing 0%-100% lit)
// subtracted from global.ambient_darkness in obj_ctrl_lighting to create a lit spot on the screen
light_intensity = 0.5;
light_intensity_default = 0.5;
//obj_ctrl_lighting draws a circle of light with the correct color after subtracting
// the alpha of light_intensity from the global.ambient_darkness
light_color_alpha = 0.1;

//how strong the light is(for the player's "light_level" var, so 0-4)
light_level = 2;

//sprite to use for the light area
light_shape_sprite = spr_light_circle;
image_speed = 0;
lastframe = 4;
//shape of the light hitbox. What is the shape of the area that counts as lit?
light_shape = "rectangle";
//scale the light area
xscale = 1;
yscale = 1;
//rotate the light area(angle)
rotation = 0;
//color of the light
color = c_white;

//coordinates of the corners of a virtual bounding box
//used by obj_monster to check if it is in light or not
//takes into account the scale and sprite chosen
//(copy this code into the step event if object will move)
//(creates a box placed around the origin;
//for weird shapes, you can manipulate the use of the truewidth and trueheight values)
truewidth = xscale * sprite_get_width(light_shape_sprite);
trueheight = yscale * sprite_get_height(light_shape_sprite);


//if the shape is a circle
light_shape_radius = (truewidth/2);

//top left corner if rectangular light; center point if circle
light_shape_x1 = x - (truewidth/2);
light_shape_y1 = y - (trueheight/2);

//bottom right corner if rectangular light; not used for circle
light_shape_x2 = x + (truewidth/2);
light_shape_y2 = y + (trueheight/2);


