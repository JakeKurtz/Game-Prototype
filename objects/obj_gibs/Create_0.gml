image_xscale = image_xscale*2; //random_range(0.90, 1.10)*2;
image_yscale = image_yscale*2;
image_angle=irandom(359)
image_index=irandom(image_number-1)
image_speed = 0;

velocity = vector(irandom_range(-2,2),irandom_range(-2,2));
decel = 0.05;