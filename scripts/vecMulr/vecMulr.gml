///@function vector_scaler Scales the vector to the distance specified
///@arg vector
///@arg scale

var r = argument0;
var v1 = argument1;
var v;

for(var i = 0; i < array_length_1d(v1); i++) {
    v[i] = v1[i] * r;
}

return v;