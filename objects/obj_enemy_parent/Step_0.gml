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
	
	var _point_to_player = vector((obj_player.x - x),(obj_player.y - y));
	
	// Blood flys towards player
	part_type_direction(obj_ps.part_blood2,vector_direction(_point_to_player),vector_direction(_point_to_player)+45,0,0);
	part_type_speed(obj_ps.part_blood2,(vector_len(obj_player.velocity)/3)-1,(vector_len(obj_player.velocity)/3)+1,0,0);
	
	part_type_direction(obj_ps.part_blood,vector_direction(_point_to_player),vector_direction(_point_to_player)+45,0,0);
	part_type_speed(obj_ps.part_blood,(vector_len(obj_player.velocity)/3)-2,(vector_len(obj_player.velocity)/3)+2,0,0);
	
	part_emitter_region(obj_ps.part_system, obj_ps.part_emitter, x-6, x+6, y-3, y+3, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_blood2, 5);
	part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_blood, 10);
	
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

state_execute();

if (_health <= 0) {
	state_switch("Die");
}
