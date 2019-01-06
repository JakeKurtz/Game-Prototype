// @description: Object follows the closest leader.
// @param: leader object.
// @param: The distance to stop at behind leader.
// @param: Weight of force

var _leader = argument[0];
var _leader_behind_dist = argument[1];
var _sight_radius = argument[2];
var _weight = argument[3];

var _force = vector(0,0);
var _nearest_leader = instance_nearest(x,y,_leader)

if (_nearest_leader != noone) {	
	var _tv = _nearest_leader.velocity;

	_tv = vector_norm(_tv);
	_tv = vector_scaler(_tv,_leader_behind_dist);
	
	// Calculating ahead point.
	var _ahead = vector_add(_nearest_leader.position, _tv);
	
	// Calculating behind point.
	_tv = vector_scaler(_tv,-1);
	var _behind = vector_add(_nearest_leader.position, _tv);

	// If the character is on the leader's sight, add a force
    // to evade the route immediately.
	
    if (distance_to_point(_ahead[1],_ahead[2]) <= _sight_radius || distance_to_object(_nearest_leader) <= _sight_radius) {
        _force = vector_add(_force, sb_evade(_nearest_leader, _weight*2.5));
    }

	// Creates a force to arrive at the behind point
	_force = vector_add(_force, sb_seek_arrive(_behind[1],_behind[2], _leader_behind_dist, _weight));
	
	return _force;
}
else return _force;
