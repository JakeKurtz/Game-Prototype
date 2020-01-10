///@function vector_norm Normalises a scalar to vector 
///@arg v

var v1 = argument0;
var v;

var length = 0;

for(var i = 0; i < array_length_1d(v1); i++) {
    v[i] = 0;
    length += v1[i] * v1[i];
}

if(length > 0) {
    length = sqrt(length);
    for(var i = 0; i < array_length_1d(v1); i++) {
        v[i] = v1[i] / length;
    }
}
return v;