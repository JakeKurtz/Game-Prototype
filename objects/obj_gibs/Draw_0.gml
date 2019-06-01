/// @description

position = vector(x,y);

draw_shadow(image_xscale*4,image_yscale*2,0,1,0.75);

// Only draws blood if gib is moving
if (can_draw && z_velocity <= 0) { 
	surface_set_target(obj_surface.surface_gore);
	
	draw_sprite_ext(spr_bloodSplat,irandom(image_number-1),x,y,0.5,0.5,irandom(360),c_white,1);

	surface_reset_target();

	can_draw = false;
	alarm[0] = 8;
}
y+=z;
draw_self();
y-=z;