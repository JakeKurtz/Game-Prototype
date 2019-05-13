///@function vector_mul Multiplies each component of vect1 with each component of vect2
///@arg v1
///@arg v2
///@ret v 

var v1 = argument0;
var v2 = argument1;
var v;

var num = min(v1[0],v2[0]);
v[0] = num;

for(var i = 1; i <= num; i++) {
    v[i] = v1[i] * v2[i];
}
return v;

