/// @description Insert description here
// You can write your code in this editor

if can_collide {
	with obj_player {
		_health += 5;
	}

	instance_destroy(self);
}