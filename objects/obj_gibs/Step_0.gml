/// @description Gib physics

depth = -y + 10;

// Decelerating movement
velocity = vector_add(velocity, vector(-velocity[1]*decel, -velocity[2]*decel));

velocity[1] = clamp(velocity[1], -3, 3);
velocity[2] = clamp(velocity[2], -3, 3);

// gravity
z_velocity += grav;

z += z_velocity;

// z collision
if(z>0) {
	z = 0; 
	z_velocity *= -0.8;
}

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

zvel_3 = zvel_2;
zvel_2 = zvel_1;
zvel_1 = z;

vel_3 = vel_2;
vel_2 = vel_1;
vel_1 = vector_len(velocity);
