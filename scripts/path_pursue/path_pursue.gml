///sb_path_loop(path, max_distance, dir, weight)
///Return vector for following a path (looped)

var _path = argument[0];
var _slow_radius = argument[1];
var _dir = argument[2]; // 1 for forwards, -1 for backwards
var _weight = argument[3];

var _target_x = path_get_point_x(_path, 1);
var _target_y = path_get_point_y(_path, 1);
var _target = vector(_target_x, _target_y);

var _last_point = 0;

var _distance_to_point = vector_len(vector_sub(_target,position));
// subtract current position from target position and constrain to max_speed
var _desired_velocity = vector_scaler(vector_sub(_target,position),MAX_SPEED);

if(_distance_to_point < _slow_radius && path_get_length(_path) <= _slow_radius) { //Inside slowing radius
	_desired_velocity = vector_mulr(vector_norm(_desired_velocity), MAX_SPEED * (_distance_to_point / _slow_radius));
}

return (vector_scaler(vector_sub(_desired_velocity,velocity),_weight));
