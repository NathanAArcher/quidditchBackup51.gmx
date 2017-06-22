//argument0 = x
//argument1 = y
//argument2 = string
//argument3 = font
//argument4 = color
//argument5 = outlinecolor
//argument6 = sep
//argument7 = width

draw_set_font(argument3)
draw_set_color(argument5)
draw_text_ext(argument0-1, argument1, argument2, argument6, argument7)
draw_text_ext(argument0+1, argument1, argument2, argument6, argument7)
draw_text_ext(argument0, argument1-1, argument2, argument6, argument7)
draw_text_ext(argument0, argument1+1, argument2, argument6, argument7)
draw_set_color(argument4)
draw_text_ext(argument0, argument1, argument2, argument6, argument7)
