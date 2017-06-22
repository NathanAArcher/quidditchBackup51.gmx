//argument0 = x
//argument1 = y
//argument2 = string
//argument3 = font
//argument4 = color
//argument5 = outlinecolor
//argument6 = outlinecolor?

draw_set_font(argument3)
draw_set_color(argument5)
draw_text(argument0-2, argument1-2, argument2)
draw_text(argument0+3, argument1+2, argument2)
draw_text(argument0+3, argument1-2, argument2)
draw_text(argument0-2, argument1+2, argument2)
draw_set_color(argument6)
draw_text(argument0-1, argument1-1, argument2)
draw_text(argument0+1, argument1+1, argument2)
draw_text(argument0+1, argument1-1, argument2)
draw_text(argument0-1, argument1+1, argument2)
draw_set_color(argument4)
draw_text(argument0, argument1, argument2)
