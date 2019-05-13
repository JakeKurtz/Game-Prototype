///@function sb_seek_arrive
///@arg x
///@arg y
///@arg slow_radius
///@arg weight
///@ret vector2 for steering towards given point with slowing inside a radius

var target = vector(argument[0], argument[1]);
var slow_radius = argument[2];
var weight = argument[3];

// subtract current position from target position and constrain to SPEED
//var _desired_velocity = vect_scaler(vect_subtract(_target,position),SPEED);
var desired_velocity = vector_sub(target, position);
var distance = vector_len(desired_velocity);

if(distance < slow_radius) { //Inside slowing radius
    desired_velocity = vector_mulr(vector_norm(desired_velocity), SPEED * (distance / slow_radius));
} else { // Outside slowing radius
    desired_velocity = vector_mulr(vector_norm(desired_velocity), SPEED);
}

return (vector_mulr(vector_sub(desired_velocity, velocity), weight));

sb_evade()