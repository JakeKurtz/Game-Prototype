/// @description Insert description here
// You can write your code in this editor

event_inherited();

// list of all active vertices
active_vertices = ds_list_create();
active_edges = 0;

// number of vertices
n = instance_number(obj_vertex);

// number of edges
e = 32;

// set edges
edges = init_edges(n,n);

if (instance_number(obj_vertex) >= 5) {
	add_edge(0,1);
	add_edge(0,9);
	add_edge(0,7);
	add_edge(0,15);
	
	add_edge(1,2);
	add_edge(1,8);
	add_edge(1,10);
	
	add_edge(2,3);
	add_edge(2,9);
	add_edge(2,11);
	
	add_edge(3,4);
	add_edge(3,10);
	add_edge(3,12);
	
	add_edge(4,5);
	add_edge(4,11);
	add_edge(4,13);
	
	add_edge(5,6);
	add_edge(5,12);
	add_edge(5,14);
	
	add_edge(6,7);
	add_edge(6,13);
	add_edge(6,15);
	
	add_edge(7,8);
	add_edge(7,14);
	
	add_edge(8,13);
	add_edge(8,11);
	
	add_edge(9,12);
	add_edge(9,14);
	
	add_edge(10,15);
	add_edge(10,13);
	
	add_edge(11,14);
	
	add_edge(12,15);
}

// getting all instances into a list
vertex = ds_list_create();

for (var i = 0; i < n; i ++) {
   ds_list_add(vertex, instance_find(obj_vertex, i));
}