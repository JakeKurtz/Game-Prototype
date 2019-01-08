if(state_new) {
	can_attack = false;
    velocity[1] = 0;
	velocity[2] = 0;
	image_index = 0;
	sprite_index = attack_animations[irandom(array_length_1d(attack_animations)-1)];
}

var min_frame; 
var max_frame;

// The frames when the hitbox should be spawned in.
if sprite_index == attack_animations[0] {
	min_frame = 1;
	max_frame = 2;
} else if sprite_index == attack_animations[1] {
	min_frame = 1;
	max_frame = 2;
} else if sprite_index == attack_animations[2] {
	min_frame = 3;
	max_frame = 6;
}
	
// Spawn hit box
if (image_index >= min_frame && image_index <= max_frame) {
	with(instance_create_layer(x,y,"Compatibility_Instances_Depth_0",obj_enemyLarge_hitbox)) {
		image_xscale = other.image_xscale;
	}
}

// Paces out attacks
if (image_index+image_speed >= image_number) {
	alarm[1] = irandom_range(30, 60);
	state_switch("Idle");
}
