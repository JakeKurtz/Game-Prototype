attribute vec3 in_Position;
attribute vec3 in_Normal; 
attribute vec3 in_Color;
attribute vec2 in_TextureCoord;

varying vec3 FragPos;
varying vec3 Normal;
varying vec2 Texcoord;
varying vec3 FragPosLightSpace;

uniform mat4 lightSpaceMatrix;
uniform mat4 ModelMatrixInverseTranspose;

void main() {
	FragPos = vec3(gm_Matrices[MATRIX_WORLD] * vec4(in_Position, 1.0));
	Normal = mat3(gm_Matrices[MATRIX_WORLD]) * in_Normal;
	Texcoord = in_TextureCoord;
    FragPosLightSpace = vec3(lightSpaceMatrix * gm_Matrices[MATRIX_WORLD] * vec4(in_Position, 1.0));
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
}