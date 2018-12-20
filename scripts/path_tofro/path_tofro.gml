///sb_path_loop(path, max_distance, dir, weight)
///Return vector2 for following a path (to and fro)

var _path = argument[0];
var _max_distance = argument[1];
var _dir = argument[2]; // 1 for forwards, -1 for backwards
var _weight = argument[3];

var i = path_get_number(_path);

var _target_x = path_get_point_x(_path, path_position*i);
var _target_y = path_get_point_y(_path, path_position*i);
var _target = vector(_target_x, _target_y);

var _distance_to_point = vector_len(vector_sub(_target,position));

if(_distance_to_point < _max_distance) {
    path_position += sign(_dir)/i;
    if(path_position > (path_get_number(_path)-1)/i) { path_position -= 2/i; my_path_dir *= -1;}
    if(path_position < 0) { path_position += 2/i; my_path_dir *= -1;}
} 

// subtract current position from target position and constrain to max_speed
var _desired_velocity = vector_scaler(vector_sub(_target,position),MAX_SPEED);

return (vector_scaler(vector_sub(_desired_velocity,velocity),_weight));