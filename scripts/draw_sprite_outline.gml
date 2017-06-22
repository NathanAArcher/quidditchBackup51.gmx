/*argument0 = sprite
argument1 = subimage
argument2 = x
argument3 = y
argument4 = xscale
argument5 = yscale
argument6 = rot

*/

//draw outline around any sprite

draw_sprite_ext(argument0, argument1, argument2-argument4, argument3-argument5, argument4, argument5, argument6, c_black, 1)
draw_sprite_ext(argument0, argument1, argument2, argument3-argument5, argument4, argument5, argument6, c_black, 1)
draw_sprite_ext(argument0, argument1, argument2+argument4, argument3-argument5, argument4, argument5, argument6, c_black, 1)
draw_sprite_ext(argument0, argument1, argument2+argument4, argument3, argument4, argument5, argument6, c_black, 1)
draw_sprite_ext(argument0, argument1, argument2+argument4, argument3+argument5, argument4, argument5, argument6, c_black, 1)
draw_sprite_ext(argument0, argument1, argument2, argument3+argument5, argument4, argument5, argument6, c_black, 1)
draw_sprite_ext(argument0, argument1, argument2-argument4, argument3+argument5, argument4, argument5, argument6, c_black, 1)
draw_sprite_ext(argument0, argument1, argument2-argument4, argument3, argument4, argument5, argument6, c_black, 1)
