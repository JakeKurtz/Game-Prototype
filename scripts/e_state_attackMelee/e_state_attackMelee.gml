if(state_new) {
	if can_attack = true then can_attack = false;
	image_index = 0;
	sprite_index = attack_animations[irandom(array_length_1d(attack_animations)-1)];
}

velocity[1] = 0;
velocity[2] = 0;

var min_frame; 
var max_frame;

// Makes sure the enemy is facing the player.
var vector_dir = point_direction(x,y,obj_player.x,obj_player.y)
	
if ((vector_dir >= 0 && vector_dir <= 70) || (vector_dir >= 290 && vector_dir <= 360)) image_xscale = image_scale;
else if (vector_dir >= 110 && vector_dir <= 250) image_xscale = -image_scale;

// The frames when the hitbox should be spawned in.
for (var i = 0; i < array_length_1d(attack_animations); i++) {
    if sprite_index == attack_animations[i] {
		var vals = ds_map_find_value(hitbox_range, sprite_index);
		min_frame = vals[0];
		max_frame = vals[1];
	}
}

// Spawn hit box
if (image_index >= min_frame && image_index <= max_frame) {
	with(instance_create_layer(x,y,"Compatibility_Instances_Depth_0",obj_e_hitbox)) {
		image_xscale = other.image_xscale;
	}
}

// Paces out attacks
if (image_index+image_speed >= image_number) {
	alarm[1] = irandom_range(30, 60);
	state_switch("Idle");
}