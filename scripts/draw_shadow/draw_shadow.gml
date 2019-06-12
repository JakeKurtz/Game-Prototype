///@function draw_shadow
///@arg xscale
///@arg yscale
///@arg xoff
///@arg yoff
///@arg alpha

if(argument_count>0){
	xscale = argument[0];
	yscale = argument[1];
	xoff = argument[2];
	yoff = argument[3];
	alpha = argument[4];
} else {
	xscale = sprite_width*0.25;
	yscale = sprite_height*0.10;
	xoff = 0;
	yoff = sprite_get_bbox_bottom(sprite_index)*.25;
	alpha = 0.75;
}

if(surface_exists(obj_surface.surface_floor)){
	surface_set_target(obj_surface.surface_shadow);
	gpu_set_fog(true, c_black, 0, 0);
	draw_clear_alpha(c_black,0); // clear surface
	draw_ellipse(x-xscale+xoff, y-yscale+yoff, x+xscale+xoff, y+yscale+yoff, false);
	draw_set_alpha(alpha);
	gpu_set_fog(false, c_black, 0, 0);
	surface_reset_target();
	draw_surface(obj_surface.surface_shadow,0,0);
}


