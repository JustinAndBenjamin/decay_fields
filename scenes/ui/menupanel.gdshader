shader_type canvas_item;

void fragment() {
	vec4 color = COLOR;
	float edge = smoothstep(0.0, length(fwidth(SCREEN_UV)), 0.002);
	color.a *= edge;
	COLOR = color;
}
