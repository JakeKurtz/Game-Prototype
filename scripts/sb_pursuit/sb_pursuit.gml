///sb_pursuit(object, weight)
///Return vector2 for steering towards given object, considering objects velocity

var target_obj = argument[0];
var weight = argument[1];

if(instance_exists(target_obj)) { // Target exists
    // var _time = 10; // basic
    var time = vector_dist(position, target_obj.position) / target_obj.MAX_SPEED; // dynamic
    var target_future_pos = vector_add(target_obj.position, vector_mulr(target_obj.velocity, time));
    
    
    // subtract current position from target position and constrain to max_speed
    var _desired_velocity = vector_scaler(vector_sub(target_future_pos, position), MAX_SPEED);
    
    return (vector_mulr(vector_sub(desired_velocity, velocity), weight));

} else { // No target
    return vector(0,0);
}