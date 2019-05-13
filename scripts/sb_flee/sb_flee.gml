///@function sb_flee
///@arg x
///@arg y
///@arg weight
///@ret vector2 for steering away from a given point

var target = vector(argument[0], argument[1]);
var weight = argument[2];

// subtract target position from current position and constrain to SPEED
var desired_velocity = vector_scaler(vector_sub(position, target), SPEED);

return (vector_mulr(vector_sub(desired_velocity, velocity), weight));