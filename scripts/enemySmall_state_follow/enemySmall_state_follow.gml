/// @description Insert description here
// You can write your code in this editor

if(state_new) {
	image_index = 0;
}

// Sets the objects sprite depending on what direction it's facing.

sprite_index = walk_animations[0];

// Getting the nearest leader
var obj_nearest = instance_nearest(x,y,obj_enemy_leader);

if (obj_nearest != noone) {	
	// If the leader is behind a wall, use A* to find him.
	if ((collision_line(x,y,obj_nearest.x,obj_nearest.y,obj_solid_nonentity,0,0))){
		if (mp_grid_path(global.grid, path, x, y, obj_nearest.x, obj_nearest.y, 1)) {
			steering = vector_add(steering, sb_path_pursue(path,32,1,1.2));
		}
	}
	// Otherwise just use the normal steering.
	else {
		steering = vector_add(steering, sb_follow_leader(obj_enemy_leader, 15, 32, 1));	
	}
	//MAX_SPEED = obj_nearest.MAX_SPEED;	
	// if the dude you're following isn't too far, and the player is in range, then attack.
	if (distance_to_object(obj_player) <= 128 && distance_to_object(obj_nearest) < flee_range) {
		state_switch("Pursue");
	} 
	//
	else if (distance_to_object(obj_player) <= 128 && distance_to_object(obj_nearest) >= flee_range) {
		//state_switch("Flee");
	}
// If the leader dies, just wander.
} else state_switch("Wander");

steering = vector_add(steering, sb_avoid_collision(obj_obstacle,150,MAX_AVOID_FORCE,3));
steering = vector_add(steering, sb_avoid_collision(obj_enemy_parent,150,MAX_AVOID_FORCE,3));
steering = vector_add(steering, sb_separation(object_index,30,5));
steering = vector_add(steering, sb_alignment(object_index,30,3));
steering = vector_add(steering, sb_queue(object_index, 30, 60));
steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);