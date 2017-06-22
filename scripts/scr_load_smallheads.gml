//scr_draw_smallheads(sprite, direction/45, x, y, scale, scale, 0, c_white, 1)
//sprite_head = spr_luis_head
sprite_head = sprite_add(working_directory+"\player_heads\spr_player"+string(argument0+1)+"_head_strip8.png", 8, true, false, 16, 24)

if argument0+1 == 34{
sprite_head = sprite_add(working_directory+"\player_heads\spr_player"+string(argument0+1)+"_head_strip8.png", 8, true, false, 16, 28)
}

//draw_sprite_ext(sprite_head, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
