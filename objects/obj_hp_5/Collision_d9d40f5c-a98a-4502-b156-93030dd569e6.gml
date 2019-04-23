/// @description Insert description here
// You can write your code in this editor

if can_collide {
	with obj_player {
		_health += 5;
	}
	
	sprite_index = spr_sparkle;
	image_speed = 2;
	can_collide = false;
}