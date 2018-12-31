/// @description Insert description here
// You can write your code in this editor

if(state_new) {
	image_index = 0;
}

// Sets the objects sprite depending on what direction it's facing.

sprite_index = walk_animations[0];

// Getting the nearest leader
var obj_nearest = instance_nearest(x,y,obj_enemy_leader);

if ((collision_line(x,y,obj_nearest.x,obj_nearest.y,obj_solid_nonentity,0,0))){
	if (mp_grid_path(global.grid, path, x, y, obj_nearest.x, obj_nearest.y, 1)) {
		steering = vector_add(steering, sb_path_pursue(path,32,1,1.2));
	}
}
else {
	steering = vector_add(steering, sb_follow_leader(obj_enemy_leader, 15, 32, 1));	
}

if (obj_nearest != noone) {	
	//MAX_SPEED = obj_nearest.MAX_SPEED;
	
	// if the dude you're following isn't too far, and the player is in range, then attack.
	if (distance_to_object(obj_player) <= 128 && distance_to_object(obj_nearest) < flee_range) {
		state_switch("Pursue");
	} 
	//
	else if (distance_to_object(obj_player) <= 128 && distance_to_object(obj_nearest) >= flee_range) {
		//state_switch("Flee");
	} 
	//
	else if (obj_nearest.state_name == "Idle") {
		//sb_brake(0.8, 0.3);
		if (distance_to_object(obj_nearest) <= 128) {
			state_switch("Idle");
		}
	}
}

steering = vector_add(steering, sb_separation(object_index,50,3));
steering = vector_add(steering, sb_alignment(object_index,40,2));
steering = vector_add(steering, sb_queue(object_index, 40, 30));
steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);