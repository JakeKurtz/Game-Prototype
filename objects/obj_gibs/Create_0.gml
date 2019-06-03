image_xscale = global.image_scale;
image_yscale = global.image_scale;
image_angle=irandom(359)
image_index=irandom(image_number-1)
image_speed = 0;
image_blend = global.c_blood_red;

/*if (1 == irandom_range(0,1)) x_velocity = -1;	
else x_velocity = 1;

if (1 == irandom_range(0,1)) y_velocity = -1;	
else y_velocity = 1;

velocity = vector(x_velocity*random_range(0,1.4),y_velocity*random_range(0,1.4));*/
decel = 0.02;

z = 0;
z_velocity = random_range(-5,-2);
grav = 0.25;

can_draw = true;

zvel_1 = 1;
zvel_2 = 1;
zvel_3 = 1;

vel_1 = 1;
vel_2 = 1;
vel_3 = 1;