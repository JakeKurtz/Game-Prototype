var x1 = argument[0];
var y1 = argument[1];
var x2 = argument[2];
var y2 = argument[3];
var z_vel = argument[4];

var foobar = point_distance(x1, y1, x2, y2);

with (instance_create_layer(x1,y1,"Instances",obj_bomb)) {
	velocity = vector_scaler(vector((x2 - x),(y2 - y)), foobar*0.015);
	z_velocity = -z_vel*0.08;
}