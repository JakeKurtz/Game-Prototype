/// @description button prompt
draw_self();

if(distance_to_object(obj_player) <= 25) {
	draw_sprite_ext(spr_key_e,0,x,y+8,0.4,0.4,0,c_white,1);
}