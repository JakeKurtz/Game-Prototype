///@fucntion sb_evade
///@arg object
///@arg weight
///@ret vector2 for evading a specified object considering it's velocity

var _target_obj = argument[0];
var _weight = argument[1];

if(instance_exists(_target_obj)) { // Target exists
    var _time = 10; // basic
    //var _time = vector_dist(position, _target_obj.position) / _target_obj.SPEED; // dynamic
    var _target_future_pos = vector_add(_target_obj.position, vector_scaler(_target_obj.velocity, _time));
    
    
    // subtract current position from target position and constrain to SPEED
    var _desired_velocity = vector_scaler(vector_sub(position,_target_future_pos),SPEED);
    
    return (vector_mulr(vector_sub(_desired_velocity,velocity),_weight));

} else { // No target
    return vector(0,0);
}