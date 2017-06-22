//(argument1*45)+1 = draw_direction

//scr_draw_smallheads(sprite, direction/45, x, y, scale, scale, 0, c_white, 1)
/*if argument0 == 0{
//sprite_head = spr_luis_head
sprite_head = sprite_add(working_directory+"\player_heads\spr_player"+string(argument0+1)+"_head.png", 8, true, false, 16, 24)
}
if argument0 == 1{
sprite_head = spr_jonmilan_head
}
if argument0 == 2{ //needs replacing?
sprite_head = spr_crispy_head
}
if argument0 == 3{
sprite_head = spr_ariel_head
}
if argument0 == 4{
sprite_head = spr_laurel_head
}
if argument0 == 5{ //needs replacing
sprite_head = spr_nathan_head
}
if argument0 == 6{
sprite_head = spr_ryan_head
}
if argument0 == 7{
sprite_head = spr_ben_head
}
if argument0 == 8{
sprite_head = spr_milan_head
}
if argument0 == 9{
sprite_head = spr_bolivia_head
}
if argument0 == 10{
sprite_head = spr_luke_head
}
if argument0 == 13{
sprite_head = spr_kevin_head
}
if argument0 == 14{
sprite_head = spr_cory_head
}
if argument0 == 15{
sprite_head = spr_chrisd_head
}
if argument0 == 16{
sprite_head = spr_cory_head
}
if argument0 == 17{
sprite_head = spr_josh_head
}
if argument0 == 18{ //jana head. needs replacing
sprite_head = spr_laurel_head
}
if argument0 == 19{ //needs replacing
sprite_head = spr_anthony_head
}
if argument0 == 20{ //needs replacing badly
sprite_head = spr_emma_head
}
if argument0 == 21{
sprite_head = spr_jack_head
}
if argument0 == 22{
sprite_head = spr_abbi_head
}
if argument0 == 28{
sprite_head = spr_haroun_head
}
if argument0 == 30{
sprite_head = spr_joey_head
}
if argument0 == 34{
sprite_head = spr_tom_head
}
if argument0 == 51{
sprite_head = spr_calypso_head
}
if argument0 == 54{
sprite_head = spr_frank_head
}*/


//OLD
//draw_sprite_ext(sprite_head, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)

//argument0 = self_id
//argument1 = image_index
//argument2 = x
//argument3 = y
//argument4 = xscale
//argument5 = yscale
//argument6 = angle
//argument7 = color
//argument8 = alpha
//scr_draw_smallheads(self_id, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, headangle, c_white, 1)
//scr_draw_smallheads(self_id, 4, x+10, y-11, scale, scale, headangle, c_white, 1)

                if (argument1*45)+1 < 22.5 or (argument1*45)+1 >= 337.5{
                        draw_sprite_ext(sprite_head, 0, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 67.5 and (argument1*45)+1 >= 22.5{
                        draw_sprite_ext(sprite_head, 1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 112.5 and (argument1*45)+1 >= 67.5{
                        draw_sprite_ext(sprite_head, 2, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 157.5 and (argument1*45)+1 >= 112.5{
                        draw_sprite_ext(sprite_head, 3, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 202.5 and (argument1*45)+1 >= 157.5{
                        draw_sprite_ext(sprite_head, 4, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 247.5 and (argument1*45)+1 >= 202.5{
                        draw_sprite_ext(sprite_head, 5, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 292.5 and (argument1*45)+1 >= 247.5{
                        draw_sprite_ext(sprite_head, 6, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
                if (argument1*45)+1 < 337.5 and (argument1*45)+1 >= 292.5{
                        draw_sprite_ext(sprite_head, 7, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
                }
