// checks which positions around the player are free

var _angle = point_direction(obj_player.x, obj_player.y, x, y);
var _interval_size = obj_player.atk_point_interval;
var _ret = noone;

for (var i = 1; i < ds_map_size(atk_point_map); ++i) {
	var _position = (round(_angle / _interval_size) * _interval_size * i);
	if (_position >= 360) _position = 0;
	
	var _position_taken = ds_map_find_value(obj_player.atk_point_map, string(_position));
	
	if _position_taken {
		continue;
	} else if !_position_taken {
		ds_map_replace(obj_player.atk_point_map,string(i*_interval_size),true);
		_ret = _position;
	}
}

return _ret;