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
	} else {
		// Otherwise just use the normal steering.
		MAX_SPEED = obj_nearest.MAX_SPEED;
		steering = vector_add(steering, sb_follow_leader(obj_enemy_leader, 15, 32, 1));	
	}
	//MAX_SPEED = obj_nearest.MAX_SPEED;	
	// if the dude you're following isn't too far, and the player is in range, then attack.
	//if (distance_to_object(obj_player) <= 128 && distance_to_object(obj_nearest) < flee_range) {
	//	state_switch("Pursue");
	//}
	// If the enemey spots the player, change to pursue state.
	if (!(collision_line(x,y,obj_player.x,obj_player.y,obj_solid_nonentity,1,0)) && distance_to_object(obj_player) <= SIGHT_RADIUS) {
		//velocity[1] = 0;
		//velocity[2] = 0;
		//sprite_index = spr_minotaur_taunt;
		state_switch("Pursue");	
	}
// If the leader dies, just wander.
} else state_switch("Patrol");

steering = vector_add(steering, sb_avoid_collision(obj_obstacle,50,MAX_AVOID_FORCE,2));
steering = vector_add(steering, sb_separation(obj_obstacle,30,1));

steering = vector_add(steering, sb_avoid_collision(object_index,100,MAX_AVOID_FORCE,2));
steering = vector_add(steering, sb_separation(object_index,30,5));
steering = vector_add(steering, sb_queue(object_index, 30, 60));
steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);