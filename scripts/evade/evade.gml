///sb_evade(object, weight)
///Return vector2 for evading a specified object considering it's velocity
/*
var target_obj = argument[0];
var weight = argument[1];

if(instance_exists(target_obj)) { // Target exists
    // var _time = 10; // basic
    var time = vect_dist(position, _target_obj.position) / target_obj.max_speed; // dynamic
    var target_future_pos = vect_add(_target_obj.position, vect_multr(target_obj.velocity, time));
    
    
    // subtract current position from target position and constrain to max_speed
    var _desired_velocity = vect_scaler(vect_subtract(position,_target_future_pos),max_speed);
    
    return (vect_multr(vect_subtract(desired_velocity,velocity),_weight));

} else { // No target
    return vect2(0,0);
}*/