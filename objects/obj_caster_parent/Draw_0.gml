/// @description Insert description here
// You can write your code in this editor
/*

var _color = c_white;
				
if obj_light.y > y then _color = c_white;
else _color = c_black;
				
show_debug_message(obj_light.y);*/

draw_self();

if(surface_exists(obj_draw_mid.surface_castor)){
    surface_set_target(obj_draw_mid.surface_castor);
	//draw_self();
	//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);
	surface_reset_target();
}