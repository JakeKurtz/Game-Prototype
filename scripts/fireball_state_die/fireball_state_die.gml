if (state_new) {
	with(instance_create_layer(x,y,"Compatibility_Instances_Depth_0", obj_fireBall_explode)) {
		image_xscale = image_xscale *.75;
		image_yscale = image_yscale*.75;
	}
	alarm[0] = 2;
}