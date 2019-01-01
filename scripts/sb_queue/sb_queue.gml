// @description: 
// @param: object
// @param: max radius queue
// @param: max queue ahead

var _object = argument[0];
var _max_radius_queue = argument[1];
var _max_queue_ahead = argument[2];

var _force = velocity;
var _brake = vector(0,0);
var _neighbor = noone;


// Checks if neighbor is ahead
var _qa  = vector_scaler(vector_norm(velocity), _max_queue_ahead);
var _ahead = vector_add(_qa, position);
     
for (var i = 0; i < instance_number(_object); i++) {
    var _instance = instance_find(_object, i);
    var _d = point_distance(_ahead[1],_ahead[2], _instance.x, _instance.y)
    if (_instance != id && _d <= _max_radius_queue) {
        _neighbor = _instance;
        break;
    }
}

// Braking force
if (_neighbor != noone) {
    _brake[1] = -steering[1] * 0.8;
    _brake[2] = -steering[2] * 0.8;
         
    _force = vector_scaler(_force, -1);
    _brake = vector_add(_brake, _force);
    _brake = vector_add(_brake, sb_separation(_object, 30, 1));
         
    if (point_distance(position[1], position[2], _neighbor.position[1], _neighbor.position[2]) <= _max_radius_queue) {
        velocity = vector_scaler(velocity, 0.3);
    }
}
return _brake;