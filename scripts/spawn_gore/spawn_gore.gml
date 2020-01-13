/// @description Spawns gore
// TODO: have the gibs fly away from object that killed it.

var killed_by = argument[0];

var how_much_gibs=irandom(2)+3;   
for (var i=0;i<how_much_gibs;i++) { 
   with (instance_create_layer(x+(irandom_range(-5, 5)),y+(irandom_range(-5, 5)), "Instances", obj_gibs)) {
		var _point_to_object = vector((killed_by.x - x+irandom_range(-10,10)),(killed_by.y - y+irandom_range(-10,10)));
		velocity = vector_mulr(vector_scaler(_point_to_object, -1), irandom(5));
   }
}

var how_much_blood=irandom(5)+3;
for (var i=0;i<how_much_blood;i++) { 
    instance_create_layer(x+(irandom_range(-5, 5)),y+(irandom_range(-5, 5)), "surface_floor", obj_blood);
}

instance_destroy();