draw_set_font(fnt_Message);
draw_set_color(c_white);
draw_set_alpha(1)
draw_set_halign(fa_left)
//draw_rectangle_color(view_xview[0], view_yview[0]+360, view_xview[0]+640, view_yview[0]+480,c_white,c_white,c_white,c_white,false)
//draw_rectangle_color(view_xview[0], view_yview[0]+360, view_xview[0]+640, view_yview[0]+480,c_black,c_black,c_white,c_black,true);
//draw_sprite(spr_message_box, 0, view_xview[0], view_yview[0]+360)
draw_sprite(spr_message_box, -1, view_xview[0], view_yview[0]+400)
//draw_sprite(spr_message_faces, argument0,view_xview[0]+32, view_yview[0]+400-64)
draw_sprite_ext(spr_message_faces, argument0, view_xview[0]+38, view_yview[0]+480-56, .5, .5, 0, c_white, 1)

draw_text(view_xview[0]+90,view_yview[0]+480-32, string_copy(ThirdLine,0,count));
draw_text(view_xview[0]+90,view_yview[0]+480-64,SecondLine);
//draw_text(view_xview[0]+90,view_yview[0]+480-96,FirstLine);
if(count > string_length(ThirdLine)){
draw_sprite(spr_message_arrow,-1,view_xview[0]+616, view_yview[0]+464);
}

if(string_copy(ThirdLine,count,1) = ".")
{
count -= 1;
count += 1/10;
}

//Credit must be given to Nathan Archer; Free to use in profit and non-profit games
//so long as the engine is credited.
