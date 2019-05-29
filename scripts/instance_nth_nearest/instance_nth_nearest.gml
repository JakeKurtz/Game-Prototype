///@function instance_nth_nearest(x,y,obj,n)
///@arg x point coordinates, real
///@arg y point coordinates, real
///@arg obj object index (or all), real
///@arg n proximity, real
///@descriptoin Returns the id of the nth nearest instance of an object to a given point or noone if none is found.
/// GMLscripts.com/license

var pointx,pointy,object,n,list,nearest;

pointx = argument0;
pointy = argument1;
object = argument2;
n = argument3;

n = min(max(1,n),instance_number(object));
list = ds_priority_create();
nearest = noone;

with (object) ds_priority_add(list,id,distance_to_point(pointx, pointy));
repeat (n) nearest = ds_priority_delete_min(list);

if (ds_priority_size(list) < n) {
	ds_priority_destroy(list);
	return noone;
} else {
	ds_priority_destroy(list);
	return nearest;
}