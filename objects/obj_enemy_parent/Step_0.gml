/// @description Direction, Collision, Velocity.

position = vector(x,y);

depth = -y;

var vector_dir = ceil(vector_direction(velocity));

if (vector_dir >= 0 && vector_dir <= 15) facing = 2;
else if (vector_dir >= 45 && vector_dir < 90) facing = 0;
else if (vector_dir >= 90 && vector_dir < 135) facing = 0;
else if (vector_dir >= 165 && vector_dir <= 195) facing = 1;
else if (vector_dir >= 225 && vector_dir < 270) facing = 3;
else if (vector_dir >= 270 && vector_dir < 315) facing = 3;
else if (vector_dir >= 345) facing = 2;

if ((vector_dir >= 0 && vector_dir <= 70) || (vector_dir >= 290 && vector_dir <= 360)) image_xscale = image_scale;
else if (vector_dir >= 110 && vector_dir <= 250) image_xscale = -image_scale;

#region // horizontal collision
if (place_meeting(x+velocity[1],y,obj_solid_nonentity)) {
    while(!place_meeting(x+sign(velocity[1]),y,obj_solid_nonentity)) x += sign(velocity[1]);
    velocity[1] = 0;
} #endregion
x += velocity[1];

#region // vertical collision
if (place_meeting(x,y+velocity[2],obj_solid_nonentity)) {
    while(!place_meeting(x,y+sign(velocity[2]),obj_solid_nonentity)) y += sign(velocity[2]);
    velocity[2] = 0;
} #endregion
y += velocity[2];

// If the player hits you, flash and switch state to stunned.
if (place_meeting(x,y,obj_player_hitbox) && take_damage) {
	part_blood_large(obj_player);	
	flash = 1;	
	take_damage = false;
	alarm[0] = 30;
	_health -= 25;
	if (state_name != "Attack") state_switch("Stun");
}

// If the player hits you, flash and switch state to stunned.
if (place_meeting(x,y,obj_player) && obj_player.state_name == "Dash") {
	//state_switch("Stun");
}

steering = vector_add(steering, sb_avoid_collision(obj_solid_nonentity,32,MAX_AVOID_FORCE,3));
steering = vector_add(steering, sb_avoid_collision(obj_obstacle,32,MAX_AVOID_FORCE,3));

steering = vector_add(steering, sb_separation(object_index,10,5));
steering = vector_add(steering, sb_alignment(object_index,10,2));
steering = vector_add(steering, sb_cohesion(object_index,10,1));

steering = vector_add(steering, sb_queue(object_index, 8, 16));

steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), SPEED);

if (_health <= 0) {
	state_switch("Die");
}

state_execute();
