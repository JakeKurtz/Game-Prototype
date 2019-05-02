///@function addEdge
///@arg 2D array
///@arg v1
///@arg v2

v1 = argument[0];
v2 = argument[1];

edges[v1, v2] = 1;
edges[v2, v1] = 1;

