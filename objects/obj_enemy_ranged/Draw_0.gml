/// @description

shadow_size = 1;
shadow_height = 8*shadow_size; 
shadow_width = 18*shadow_size;

surface_set_target(obj_surface.surface_shadow);
gpu_set_fog(true, c_black, 0, 0);
draw_clear_alpha(c_black,0); // clear surface
draw_set_alpha(0.75);
draw_ellipse(x-shadow_width, y-shadow_height+19, x+shadow_width, y+shadow_height+19, false);
gpu_set_fog(false, c_black, 0, 0);
surface_reset_target();

draw_surface(obj_surface.surface_shadow,0,0);

draw_self();

//draw_sprite_ext(spr_arrow,0,x,y,2,2,vector_direction(velocity),c_white,1);

/*if (mp_grid_path(global.grid, path, x, y, path_get_point_x(path_patrol, 0), path_get_point_y(path_patrol, 0), 1) && can_seek) {
		draw_set_color(c_white);
		draw_path(path,x,y,1);
}*/

// Flash red when hit
if (flash > 0) {
	flash -= 0.05;
	
	//gpu_set_blendmode(bm_add);
	shader_set(shd_flash);
	shd_alpha = shader_get_uniform(shd_flash, "_alpha");
	shader_set_uniform_f(shd_alpha, flash);

	draw_self();

	shader_reset();
	//gpu_set_blendmode(bm_normal);
}