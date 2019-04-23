/// @description physics

depth = -y;

// Decelerating movement
if (velocity[1] != 0) velocity[1] -= (decel * sign(velocity[1]))
if (velocity[2] != 0) velocity[2] -= (decel * sign(velocity[2]))

velocity[1] = clamp(velocity[1], -3, 3);
velocity[2] = clamp(velocity[2], -3, 3);

// gravity
z_velocity += grav;
// z collision
if(z>0) {
	z = 0; 
	z_velocity *= -.6;
	if (abs(z_velocity)) <= 2 then z_velocity = 0;
}

z += z_velocity;

#region // horizontal collision
if (place_meeting(x + velocity[1], y, obj_solid_nonentity)) {
    while(!place_meeting(x + sign(velocity[1]), y, obj_solid_nonentity)) x += sign(velocity[1]);
    velocity[1] = 0;
} #endregion
x += velocity[1];
 
#region // vertical collision
if (place_meeting(x, y+velocity[2] ,obj_solid_nonentity)) {
    while(!place_meeting(x, y+sign(velocity[2] ), obj_solid_nonentity)) y += sign(velocity[2] );
    velocity[2]  = 0;
} #endregion
y += velocity[2];

if sprite_index == spr_sparkle && (image_index+image_speed >= image_number) instance_destroy();