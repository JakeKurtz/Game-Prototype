/// @description Insert description here
// You can write your code in this editor
var how_much_gibs=irandom(2)+3   
for (var i=0;i<how_much_gibs;i++) { 
    instance_create_layer(x+(irandom_range(-30, 30)),y+(irandom_range(-30, 30)), "Compatibility_Instances_Depth_0", obj_gibs);
}

var how_much_blood=irandom(3)+2 
for (var i=0;i<how_much_blood;i++) { 
    instance_create_layer(x+(irandom_range(-30, 30)),y+(irandom_range(-30, 30)), "Compatibility_Instances_Depth_0", obj_blood);
}