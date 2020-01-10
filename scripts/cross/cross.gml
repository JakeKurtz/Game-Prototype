var v1 = argument0;
var v2 = argument1;
var vCross;
	
vCross[0] = v1[1] * v2[2] - v1[2] * v2[1]; 
vCross[1] = v1[0] * v2[2] - v1[2] * v2[0]; 
vCross[2] = v1[0] * v2[1] - v1[1] * v2[0]; 
	
return vCross;