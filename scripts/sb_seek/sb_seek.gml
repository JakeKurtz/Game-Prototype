///@function sb_seek(x, y, weight)
///@arg x
///@arg y
///@arg weight
///@ret vector2 for steering towards given point

var _target = vector(argument[0], argument[1]);
var _weight = argument[2];

// subtract current position from target position and constrain to SPEED
var _desired_velocity = vector_scaler(vector_sub(_target, position), SPEED);

return (vector_mulr(vector_sub(_desired_velocity, velocity), _weight));
