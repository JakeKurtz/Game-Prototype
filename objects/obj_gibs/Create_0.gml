image_xscale = image_xscale*2;
image_yscale = image_yscale*2;
image_angle=irandom(359)
image_index=irandom(image_number-1)
image_speed = 0;
image_blend = global.c_blood_red;

velocity = vector(irandom_range(-3, 3),irandom_range(-3,3));
decel = 0.05;
alpha = 1;
size = 2;

can_draw = true;