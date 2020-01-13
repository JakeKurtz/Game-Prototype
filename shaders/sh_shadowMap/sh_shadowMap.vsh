attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 Texcoord;
varying float depth;

uniform mat4 lightSpaceMatrix;

void main() {
	Texcoord = in_TextureCoord;
    gl_Position = lightSpaceMatrix * gm_Matrices[MATRIX_WORLD] * vec4( in_Position, 1.0 );
    depth = gl_Position.z;
}
