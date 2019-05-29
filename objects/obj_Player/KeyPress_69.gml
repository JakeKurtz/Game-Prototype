/// @description Insert description here
// You can write your code in this editor
with(obj_vertex) {
	if(distance_to_object(obj_player) <= 25) {
		script_execute(script, "blue");
    }
}

with(obj_door_close) {
	if(distance_to_object(obj_player) <= 25 && locked == false) {
		image_speed=1;
    }
	
	if (locked) {
		val = ds_list_find_index(inventory, key);
		if (val != -1) {
			//play open lock animation
			locked = false;
		} else {
			//play rattle animation
		}
	}
}

with(obj_door_open) {
	if(distance_to_object(obj_player) <= 25) {
		image_speed=-1;
    }
}