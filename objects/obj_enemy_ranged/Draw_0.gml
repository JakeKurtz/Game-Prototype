/// @description Insert description here
// You can write your code in this editor
draw_set_colour(c_purple);

draw_text(20,20,string_hash_to_newline("State: "+string(state_name)+"#X velocity: "+string(velocity[1])+"#Y velocity: "+string(velocity[2])));
draw_sprite_ext(spr_arrow,0,x,y,2,1,vector_direction(velocity),c_red,1);
draw_self();
