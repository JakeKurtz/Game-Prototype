/// @description Insert description here
// You can write your code in this editor

if can_collide {
	with obj_player {
		_health += 15;
	}
	sprite_index = spr_sparkle;
	image_xscale = image_xscale*.5;
	image_yscale = image_yscale*.5;
	image_speed = 2;
	can_collide = false;
	shadow = false;
}