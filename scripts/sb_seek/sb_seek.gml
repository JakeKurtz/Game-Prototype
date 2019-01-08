///sb_seek(x, y, weight)
///Return vector2 for steering towards given point

var _target = vector(argument[0], argument[1]);
var _weight = argument[2];

// subtract current position from target position and constrain to max_speed
var _desired_velocity = vector_scaler(vector_sub(_target, position), MAX_SPEED);

return (vector_mulr(vector_sub(_desired_velocity, velocity), _weight));
