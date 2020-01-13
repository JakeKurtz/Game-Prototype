varying vec3 FragPos;
varying vec3 Normal;
varying vec2 Texcoord;
varying vec3 FragPosLightSpace;

uniform vec3 viewPos;
uniform vec3 lightPos;
uniform vec3 lightColor;
uniform int lightToggle;
uniform sampler2D shadowMap;

float color_to_depth( vec3 rgb) {
     return dot(rgb, vec3( 0.996093809371817, 0.00389099144285866, 0.0000151991853236666 ));
}

float in_shadow (vec3 pos) {
	
	pos.xy = pos.xy * vec2(0.5, -0.5) + 0.5;
	
	vec3 normal = normalize(Normal);
	vec3 lightDir = normalize(lightPos - FragPos);
	
	float bias = max(0.01 * (1.0 - dot(normal, lightDir)), 0.001);
	
	float closestDepth = color_to_depth(texture2D(shadowMap, pos.xy).rgb);
	float currentDepth = pos.z;
	
	float shadow = currentDepth - 0.0001 > closestDepth ? 1.0 : 0.0;
	
	return shadow;
}

void main() {
	
	if (texture2D(gm_BaseTexture, Texcoord).a < 1.0) discard;
	
	vec3 color = texture2D(gm_BaseTexture, Texcoord).rgb;
    vec3 normal = normalize(Normal);
	
    // ambient
    vec3 ambient = 0.3 * color;
	
    // diffuse
    vec3 lightDir = normalize(lightPos - FragPos);
    float dif = max(dot(lightDir, normal), 0.0);
    vec3 diffuse = dif * lightColor;
	
    // specular
    vec3 viewDir = normalize(viewPos - FragPos);
    vec3 reflectDir = reflect(-lightDir, normal);
    float spec = 0.0;
    vec3 halfwayDir = normalize(lightDir + viewDir);  
    spec = pow(max(dot(normal, halfwayDir), 0.0), 128.0);
    vec3 specular = spec * lightColor;
	
    // calculate shadow
	float shadow = in_shadow(FragPosLightSpace);
	
    vec3 lighting = (ambient + (1.0 - shadow) * (diffuse + specular)) * color;  
    
	if (lightToggle == 1) gl_FragColor = vec4(lighting, 1.0);
	else gl_FragColor = vec4(color, 1.0);
}