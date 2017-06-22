xvalue1 = argument0
yvalue1 = argument1
xvalue2 = argument2
yvalue2 = argument3
maincolor = argument4
upperleftborder = argument5
lowerrightborder = argument6

draw_set_alpha(.5)
draw_set_color(c_black)
draw_rectangle(xvalue1, yvalue1, xvalue2+7, yvalue2+7, false)

draw_set_alpha(1)

/*if room == rm_offense or room == rm_offense_alt{
    if global.selectedposition == 3{
        draw_set_alpha(1)
    }else{
        draw_set_alpha(.33)
    }
}*/

draw_set_color(upperleftborder)
draw_rectangle(xvalue1-2, yvalue1-2, xvalue2, yvalue2, false)
draw_set_color(lowerrightborder)
draw_rectangle(xvalue1, yvalue1, xvalue2+2, yvalue2+2, false)
draw_set_color(maincolor)
draw_rectangle(xvalue1, yvalue1, xvalue2, yvalue2, false)
