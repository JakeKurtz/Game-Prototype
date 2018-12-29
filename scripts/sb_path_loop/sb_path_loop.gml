///sb_path_loop(path, max_distance, dir, weight)
///Return vector2 for following a path (looped)

var _path = argument[0];
var _max_distance = argument[1];
var _dir = argument[2]; // 1 for forwards, -1 for backwards
var _weight = argument[3];

var _target_x = path_get_point_x(_path, my_path_position);
var _target_y = path_get_point_y(_path, my_path_position);
var _target = vector(_target_x, _target_y);

var _distance_to_point = vector_len(vector_sub(_target,position));

if(_distance_to_point < _max_distance) { //point reached
    my_path_position += sign(_dir);
    if(my_path_position > path_get_number(_path)-1) { my_path_position = 0; }
    if(my_path_position < 0) { my_path_position = path_get_number(_path)-1; }
} 

// subtract current position from target position and constrain to max_speed
var _desired_velocity = vector_scaler(vector_sub(_target,position),max_speed);

return (vector_mul(vector_sub(_desired_velocity,velocity),_weight));
