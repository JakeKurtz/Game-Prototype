/// @description Insert description here
// You can write your code in this editor

event_inherited();

image_scale = obj_enemy_small.image_scale;

image_xscale = image_xscale*image_scale;
image_yscale = image_yscale*image_scale;

with (obj_enemy_small) {
	for (var i = 0; i < array_length_1d(attack_animations); ++i) {
	    if (sprite_index == attack_animations[i]) {
			obj_enemySmall_hitbox.image_index = i;
		}
	}
}

alarm[0] = 2;