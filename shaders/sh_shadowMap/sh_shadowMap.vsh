attribute vec3 in_Position;

varying float depth;

uniform mat4 lightSpaceMatrix;

void main() {
    gl_Position = lightSpaceMatrix * gm_Matrices[MATRIX_WORLD] * vec4( in_Position, 1.0 );
    depth = gl_Position.z;
}
