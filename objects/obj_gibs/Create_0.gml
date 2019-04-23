image_xscale = image_xscale*2;
image_yscale = image_yscale*2;
image_angle=irandom(359)
image_index=irandom(image_number-1)
image_speed = 0;
image_blend = global.c_blood_red;

if (1 == irandom_range(0,1)) x_velocity = -1;	
else x_velocity = 1;

if (1 == irandom_range(0,1)) y_velocity = -1;	
else y_velocity = 1;

velocity = vector(x_velocity*irandom_range(1,5),y_velocity*irandom_range(1,5));
decel = 0.05;
alpha = 0.85;
size = 2;

z = 0;
z_velocity = irandom_range(-10,-5);
grav = 0.5;

can_draw = true;