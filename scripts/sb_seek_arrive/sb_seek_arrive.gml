///sb_seek_arrive(x, y, slow_radius, weight)
///Return vector2 for steering towards given point with slowing inside a radius

var target = vector(argument[0], argument[1]);
var slow_radius = argument[2];
var weight = argument[3];

// subtract current position from target position and constrain to max_speed
//var _desired_velocity = vect_scaler(vect_subtract(_target,position),max_speed);
var desired_velocity = vector_sub(target, position);
var distance = vector_len(desired_velocity);

if(distance < slow_radius) { //Inside slowing radius
    desired_velocity = vector_mulr(vector_norm(desired_velocity), MAX_SPEED * (distance / slow_radius));
} else { // Outside slowing radius
    desired_velocity = vector_mulr(vector_norm(desired_velocity), MAX_SPEED);
}

return (vector_mulr(vector_sub(desired_velocity, velocity), weight));