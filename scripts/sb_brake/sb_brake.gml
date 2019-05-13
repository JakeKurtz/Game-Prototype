///@function sb_brake
///@arg decel_rate
///@arg decel_thing

var _decel_rate = argument[0];
var _decel_thing = argument[0];

var _force = velocity;
var _brake = vector(0,0);

_brake[1] = -steering[1] * _decel_rate;
_brake[2] = -steering[2] * _decel_rate;
         
_force = vector_scaler(_force, -1);
_brake = vector_add(_brake, _force);
         
velocity = vector_scaler(velocity, _decel_thing);