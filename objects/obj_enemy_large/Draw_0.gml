/// @description Insert description here
// You can write your code in this editor
image_blend = make_colour_rgb(0, 0, 255);
draw_set_colour(c_black);
draw_set_alpha(0.25);
draw_ellipse(x-shadow_width*.5, y+shadow_height*.15+24, x+shadow_width*.5, y-shadow_height*.25+24, false);

draw_text(20,20,string_hash_to_newline("State: "+string(state_name)));

draw_self();