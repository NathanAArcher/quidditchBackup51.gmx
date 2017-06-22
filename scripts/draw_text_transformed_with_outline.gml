//argument0 = x
//argument1 = y
//argument2 = string
//argument3 = font
//argument4 = color
//argument5 = outlinecolor
//argument6 = xscale
//argument7 = yscale

draw_set_font(argument3)
draw_set_color(argument5)
draw_text_transformed(argument0-2, argument1, argument2, argument6, argument7, 0)
draw_text_transformed(argument0+2, argument1, argument2, argument6, argument7, 0)
draw_text_transformed(argument0, argument1-2, argument2, argument6, argument7, 0)
draw_text_transformed(argument0, argument1+2, argument2, argument6, argument7, 0)
draw_set_color(argument4)
draw_text_transformed(argument0, argument1, argument2, argument6, argument7, 0)
