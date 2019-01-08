if (state_new) {
	with(instance_create_layer(x,y,"Compatibility_Instances_Depth_0", obj_fireBall_explode)) {
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	alarm[0] = 2;
}