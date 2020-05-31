shader_type canvas_item;

uniform float speed;
uniform float red_desaturation : hint_range(0.0, 1.0);
uniform float density : hint_range(0.1, 2.0);
uniform sampler2D noise : hint_albedo;

void fragment() {
	vec4 cover = texture(TEXTURE, UV);

	if (cover.a == 0.0) {
		return;
	}

	vec4 n1 = texture(noise, UV + TIME * speed);
	vec4 n2 = texture(noise, vec2(UV.y, UV.x) - TIME * speed);

	if (cover.r > 0.0) {
		cover.a = 1.0 - cover.r;
		cover.rgb = vec3(0.0, 0.0, 0.0);
	}

	vec4 final = mix(n1, n2, 0.5);

	final.a = min(cover.a, final.r);
	final.a = min(final.a, final.r) * density;
	final.r = final.r * (1.0 - red_desaturation);

	COLOR = final;
}
