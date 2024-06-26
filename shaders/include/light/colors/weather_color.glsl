#if !defined INCLUDE_LIGHT_COLORS_WEATHER_COLOR
#define INCLUDE_LIGHT_COLORS_WEATHER_COLOR

#include "/include/sky/atmosphere.glsl"

uniform float biome_may_sandstorm;

vec3 get_rain_color() {
	return mix(0.15, 1.65, smoothstep(-0.1, 0.5, sun_dir.y)) * sunlight_color * vec3(0.50, 0.60, 1.00);
}

vec3 get_snow_color() {
	return mix(0.15, 1.65, smoothstep(-0.1, 0.5, sun_dir.y)) * sunlight_color * vec3(0.35, 0.50, 1.00);
}

vec3 get_sandstorm_color() {
	return mix(0.15, 1.65, smoothstep(-0.1, 0.5, sun_dir.y)) * sunlight_color * vec3(1.00, 0.80, 0.60);
}

vec3 get_weather_color() {
	vec3 weather_color = mix(get_rain_color(), get_snow_color(), biome_may_snow);
	     weather_color = mix(weather_color, get_sandstorm_color(), biome_may_sandstorm);

	return weather_color;
}

#endif // INCLUDE_LIGHT_COLORS_WEATHER_COLOR
