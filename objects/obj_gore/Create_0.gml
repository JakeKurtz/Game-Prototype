/// @description Spawns gore

var how_much_gibs=irandom(5)+5   
for (var i=0;i<how_much_gibs;i++) { 
    instance_create_layer(x+(irandom_range(-5, 5)),y+(irandom_range(-5, 5)), "Compatibility_Instances_Depth_0", obj_gibs);
}

var how_much_blood=irandom(2)+1
for (var i=0;i<how_much_blood;i++) { 
    instance_create_layer(x+(irandom_range(-30, 30)),y+(irandom_range(-30, 30)), "Compatibility_Instances_Depth_0", obj_blood);
}

instance_destroy();