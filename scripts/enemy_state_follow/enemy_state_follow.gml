/// @description Insert description here
// You can write your code in this editor

if(state_new) {
	image_index = 0;
	image_speed = 1;
}

// Sets the objects sprite depending on what direction it's facing.
for (var i = 0; i < 4; i++){
    if (facing == i) sprite_index = walk_animations[i];
}

// Getting the nearest leader
var obj_nearest = instance_nearest(x,y,obj_enemy_leader);

// Matching the nearest leaders speed and state
if (obj_nearest != noone) {	
	//MAX_SPEED = obj_nearest.MAX_SPEED;
	if (obj_nearest.state_name == "Idle" && distance_to_object(obj_nearest) <= 128) state_switch("Idle");
}

steering = vector_add(steering, sb_avoid_collision(obj_obstacle,64,MAX_AVOID_FORCE,1.5));
steering = vector_add(steering, sb_follow_leader(obj_enemy_leader, 100, 2));
//steering = vector_add(steering, sb_separation(object_index,32,2));
//steering = vector_add(steering, sb_alignment(object_index,32,2.5));
//steering = vector_add(steering, sb_cohesion(object_index,32,1));
steering = vector_add(steering, sb_queue(object_index, 32, 32));
steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);
