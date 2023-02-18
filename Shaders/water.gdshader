shader_type spatial;
render_mode unshaded, cull_disabled;

uniform sampler2D texturemap: hint_albedo;

void vertex() {
	VERTEX.y = VERTEX.y +  0.1*sin(VERTEX.x+TIME*1.2) + 0.1*sin(VERTEX.z+TIME*3.2);
}

void fragment() {
	ALBEDO = texture(texturemap, UV*vec2(2.1,2.1)).rgb;
	METALLIC = 0.1;
	ALPHA = 0.75;
}
