///@function sb_wander
///@arg circle_distance
///@arg circle_radius
///@arg wander_angle
///@arg weight
///@ret vector2 for steering towards random point

var circle_distance = argument[0];
var circle_radius = argument[1];
var wander_angle = argument[2]/2;
var weight = argument[3];

// Use velocity vector to place circle
var circle_center = vector_mulr(vector_norm(velocity), circle_distance);

var displacement = vector(0, -1);
displacement = vector_mulr(displacement, circle_radius);

//Set the angle
var displacement_length = vector_len(displacement);
var random_angle = random_range(-wander_angle, wander_angle);
displacement[1] = cos(random_angle) * displacement_length;
displacement[2] = sin(random_angle) * displacement_length;

var target_position = vector_add(position, vector_add(circle_center, displacement));


// Set velocity
var desired_velocity = vector_scaler(vector_sub(target_position, position), SPEED);

return (vector_mulr(vector_sub(desired_velocity, velocity), weight));
