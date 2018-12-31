/// @description Insert description here
// You can write your code in this editor

position = vector(x,y);

depth = -y;

var vector_dir = ceil(vector_direction(velocity));

/*
if (vector_dir >= 0 && vector_dir <= 15) facing = 2;
else if (vector_dir >= 45 && vector_dir < 90) facing = 0;
else if (vector_dir >= 90 && vector_dir < 135) facing = 0;
else if (vector_dir >= 165 && vector_dir <= 195) facing = 1;
else if (vector_dir >= 225 && vector_dir < 270) facing = 3;
else if (vector_dir >= 270 && vector_dir < 315) facing = 3;
else if (vector_dir >= 345) facing = 2;*/

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

if (place_meeting(x,y,obj_player_hitbox) && take_damage) {
	flash = 1;	
	take_damage = false;
	alarm[0] = 30;
}

state_execute();