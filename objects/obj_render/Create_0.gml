gpu_set_zwriteenable(true); //Enables writing to the z-buffer
gpu_set_ztestenable(true); //Enables the depth testing, so far away things are drawn beind closer things

view_enabled = true; //Enable the use of views
view_set_visible(0, true); //Make this view visible

layer_depth(layer_get_id("Background"),100);
//layer_depth(layer_get_id("tiles_low"),GCD);				// one tile width below the ground
//layer_depth(layer_get_id("tiles_mid"),0);				// this is ground
layer_depth(layer_get_id("Assets"),-1);		// assets such as trees / grass ontop
//layer_depth(layer_get_id("tiles_high"),-GCD);
//layer_depth(layer_get_id("alyr_terrain_high"),-GCD-1);
layer_depth(layer_get_id("Controllers"),-1000);

enum RenderState{
	set,
	reset,
	size
}

renderstate = RenderState.set; // default  

//layer_script_end(layer_get_id("Background"), render_layer_master) // start zbuffering after background has drawn and cleared the screen!
//layer_script_begin(layer_get_id("Controllers"), render_layer_master) // end zbuffering before controllers run

//tilt_layer_sprites(true);