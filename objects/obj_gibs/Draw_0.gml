/// @description

position = vector(x,y);


// Only draws blood if gib is moving
if (vector_len(velocity) > 0 && can_draw) { 
	surface_set_target(obj_surface.surface_gore);

	gpu_set_fog(true, global.c_blood_red, 0, 0);
	draw_sprite_ext(spr_bloodExplosion2,irandom_range(4,9),x+irandom_range(-10,10),y+irandom_range(-10,10),size,size,0,c_white,alpha);
	gpu_set_fog(false, c_black, 0, 0);

	surface_reset_target();

	can_draw = false;
	alarm[0] = 8;
}

draw_self();