/// @description Insert description here
// You can write your code in this editor

//if instance_exists(obj_player){}
#region
switch ((((point_direction(x,y,obj_Player.x,obj_Player.y) + 22.5) mod 360) + 360) mod 360) div 45 {
	case 0: 
		hsp = -1;
		vsp = 0;
		break;
	case 1: 
		hsp = -1;
		vsp = -1;
		break;
	case 2: 
		hsp = 0;
		vsp = -1;
		break;
	case 3: 
		hsp = 1;
		vsp = -1;
		break;
	case 4: 
		hsp = 1;
		vsp = 0;
		break;
	case 5: 
		hsp = 1;
		vsp = 1;
		break;
	case 6: 
		hsp = 0;
		vsp = 1;
		break;
	case 7: 
		hsp = -1;
		vsp = 1;
		break;
} #endregion
//if distance_to_object(obj_Player) < 150{
	
if (mp_grid_path(global.grid, path, x, y, obj_Player.x, obj_Player.y, true)) {
	
	//mp_potential_path_object(path, obj_Player.x, obj_Player.y, spd, 4, all);
	
	if (instance_place(x+hsp*spd, y+vsp*spd, obj_EnemyParent) == noone) {
		path_start(path, spd, path_action_stop, false);		
	}
	else path_end();
	
	if distance_to_object(obj_Player) < 40 path_end();
}

if place_meeting(x,y,obj_EnemyParent)
{
x=xprevious
y=yprevious
}

// If enemies somehow end up inside eachother, this will just push them apart.
var pushspd = 1;
var col = instance_place(x,y,obj_EnemyParent); 

if(col){
    var dist = sign(x - col.x) * pushspd;
    if(!place_meeting(x + dist, y, obj_WallParent))
        x += dist;
}
//}