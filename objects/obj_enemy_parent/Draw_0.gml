/// @description Insert description here
// You can write your code in this editor

//draw_set_colour(c_black);
//draw_set_alpha(0.25);
//draw_ellipse(x-shadow_width*.5, y+shadow_height*.15+24, x+shadow_width*.5, y-shadow_height*.25+24, false);

draw_self();

if (place_meeting(x,y,obj_player_hitbox) && take_damage) {
	draw_blood = true;
}

draw_sprite_ext(spr_blood,-1,x,y,image_scale,image_scale,0,c_white,1);