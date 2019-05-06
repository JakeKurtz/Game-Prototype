/// @description button prompt
draw_self();

if(distance_to_object(obj_player) <= 25) {
	draw_sprite_ext(spr_key_e,0,x,y+8,0.40,0.4,0,c_blue,1);
	draw_sprite_ext(spr_key_q,0,x+15,y+8,0.4,0.4,0,c_red,1);
}