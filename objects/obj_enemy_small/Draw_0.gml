/// @description

//shadow_size = 0.8;
//shadow_height = 45*shadow_size; 
//shadow_width = 40*shadow_size;

//draw_set_alpha(0.25);
//draw_ellipse_color(x-shadow_width*.5, y+shadow_height*.15+15, x+shadow_width*.5, y-shadow_height*.25+15, c_black, c_black, false);

//draw_text(20,20,string_hash_to_newline("State: "+string(state_name)+"#X velocity: "+string(velocity[1])+"#Y velocity: "+string(velocity[2])));
//draw_sprite_ext(spr_arrow,0,x,y,2,1,vector_direction(velocity),c_red,1);

draw_self();

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