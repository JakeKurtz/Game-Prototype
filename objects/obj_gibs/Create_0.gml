image_xscale = global.image_scale;
image_yscale = global.image_scale;
image_angle=irandom(359)
image_index=irandom(image_number-1)
image_speed = 0;
image_blend = global.c_blood_red;

if (1 == irandom_range(0,1)) x_velocity = -1;	
else x_velocity = 1;

if (1 == irandom_range(0,1)) y_velocity = -1;	
else y_velocity = 1;

velocity = vector(x_velocity*irandom_range(1,2),y_velocity*irandom_range(1,2));
decel = 0.02;
alpha = 0.85;
size = 2;

z = 0;
z_velocity = irandom_range(-10,-5);
grav = 0.5;

can_draw = true;