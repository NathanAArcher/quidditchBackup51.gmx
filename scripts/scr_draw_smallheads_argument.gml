//similar to scr_draw_smallheads BUT draws argument0, not sprite_head

//argument0 = self_id
//argument1 = image_index
//argument2 = x
//argument3 = y
//argument4 = xscale
//argument5 = yscale
//argument6 = angle
//argument7 = color
//argument8 = alpha

                if (argument1*45)+1 < 22.5 or (argument1*45)+1 >= 337.5{
                        draw_sprite_ext(argument0, 0, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 67.5 and (argument1*45)+1 >= 22.5{
                        draw_sprite_ext(argument0, 1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 112.5 and (argument1*45)+1 >= 67.5{
                        draw_sprite_ext(argument0, 2, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 157.5 and (argument1*45)+1 >= 112.5{
                        draw_sprite_ext(argument0, 3, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 202.5 and (argument1*45)+1 >= 157.5{
                        draw_sprite_ext(argument0, 4, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 247.5 and (argument1*45)+1 >= 202.5{
                        draw_sprite_ext(argument0, 5, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 292.5 and (argument1*45)+1 >= 247.5{
                        draw_sprite_ext(argument0, 6, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 337.5 and (argument1*45)+1 >= 292.5{
                        draw_sprite_ext(argument0, 7, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
