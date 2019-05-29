/// @description button prompt
draw_self();

// if locked, draw a lock
// if the player trys to unlock the door, 
//		if the player has the key then play animation of lock unlocking
//		if the player doesn't have the key then play the animation of lock rattling

if (locked) {
	draw_sprite(spr_lock,0,x,y);
}

if(distance_to_object(obj_player) <= 25) {
	draw_sprite_ext(spr_key_e,0,x,y+8,0.4,0.4,0,c_white,1);
}