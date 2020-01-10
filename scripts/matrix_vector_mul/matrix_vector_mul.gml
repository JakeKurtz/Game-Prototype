var m1 = argument0;
var v1 = argument1;
var v;

// init return vector
v[0] = 0;
v[1] = 0;
v[2] = 0;
v[3] = 0;

// add homogeneous coord
v1[3] = 1;

var offset = 0;

for (var i = 0; i < 4; i++) {
	for (var j = 0; j < 4; j++) {
		v[j] += v1[i] * m1[j + offset];
	}
	offset += 4;
}

// divide by homogeneous coord to get vec3
v = vec3(v[0]/v[3], v[1]/v[3], v[2]/v[3])

return v;
