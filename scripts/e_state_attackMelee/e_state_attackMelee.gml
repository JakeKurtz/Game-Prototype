if(state_new) {
	if can_attack = true then can_attack = false;
	image_index = 0;
	sprite_index = attack_animations[irandom(array_length_1d(attack_animations)-1)];
}

velocity[1] = 0;
velocity[2] = 0;

// Makes sure the enemy is facing the player.
var vector_dir = point_direction(x,y,obj_player.x,obj_player.y)
	
if ((vector_dir >= 0 && vector_dir <= 70) || (vector_dir >= 290 && vector_dir <= 360)) image_xscale = image_scale;
else if (vector_dir >= 110 && vector_dir <= 250) image_xscale = -image_scale;

// The frames when the hitbox should be spawned in.
for (var i = 0; i < array_length_1d(attack_animations); i++) {
    if sprite_index == attack_animations[i] var frame = ds_map_find_value(hitbox_range, sprite_index);
}

// spawning hitbox
if (hitbox == -1 && floor(image_index) == frame) hitbox = hitbox_create(12*sign(image_xscale), 12, 0, -8, 15, 3, 45);

// Paces out attacks
if (image_index+image_speed >= image_number) {
	alarm[1] = irandom_range(30, 60);
	state_switch("Idle");
}