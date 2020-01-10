///@function vector_mul Multiplies each component of vect1 with each component of vect2
///@arg v1
///@arg v2

var v1 = argument0;
var v2 = argument1;
var v;

for(var i = 0; i < array_length_1d(v1); i++) {
    v[i] = v1[i] * v2[i];
}
return v;
