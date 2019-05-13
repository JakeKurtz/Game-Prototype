if (state_new) {
	velocity[1] = 0;
	velocity[2] = 0;
	image_index = 0;
	image_speed = 1;
	//sprite_index = spr_bloodExplosion;	
}

if (irandom_range(1,15) == 1) {
	for (var i = 0; i < irandom_range(2,3); ++i) {
	    instance_create_layer(x,y, "Compatibility_Instances_Depth_0", obj_hp_5);
	}
}

if (irandom_range(1,20) == 1) {
	instance_create_layer(x,y, "Compatibility_Instances_Depth_0", obj_hp_15);
}

//if (image_index+image_speed >= image_number) {
part_emitter_region(obj_ps.part_system, obj_ps.part_emitter, x-6, x+6, y-3, y+3, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_blood2, 5);
instance_create_layer(x,y, "Compatibility_Instances_Depth_0", obj_gore);	
instance_destroy();
//}