if(state_new) {
	image_index = 0;
	image_speed = 0;
	_health -= 50;
	var _point_to_player = vector((obj_player.x - x),(obj_player.y - y));
	velocity = vector_scaler(_point_to_player, -3);
	part_type_direction(obj_ps.part_blood2,vector_direction(_point_to_player),vector_direction(_point_to_player),0,0);
	part_type_speed(obj_ps.part_blood2,(vector_len(obj_player.velocity)/3)-1,(vector_len(obj_player.velocity)/3)+1,0,0);
	
	part_type_direction(obj_ps.part_blood,vector_direction(_point_to_player)-45,vector_direction(_point_to_player)+45,0,0);
	part_type_speed(obj_ps.part_blood,(vector_len(obj_player.velocity)/3)-2,(vector_len(obj_player.velocity)/3)+2,0,0);
}

part_emitter_region(obj_ps.part_system, obj_ps.part_emitter, x-6, x+6, y-3, y+3, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_blood2, 1);
part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_blood, 10);

if (state_timer > 5) { 
	image_speed = default_image_speed; state_switch_previous();
	var how_much_blood=irandom(1)+2 
	for (var i=0;i<how_much_blood;i++) { 
	    instance_create_layer(x+(irandom_range(-30, 30)),y+(irandom_range(-30, 30)), "Compatibility_Instances_Depth_0", obj_blood);
	}
}
