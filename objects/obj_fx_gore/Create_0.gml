/// @description Insert description here
// You can write your code in this editor
how_much_gore=irandom(4)+1   
for (var i=0;i<how_much_gore;i++) { 
    instance_create_layer(x+(irandom_range(-20, 20)),y+(irandom_range(-20, 20)), "Compatibility_Instances_Depth_0", obj_gore)
}