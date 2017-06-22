/*view_xview[0..7] X position of the view in the room.
view_yview[0..7] Y position of the view in the room.
view_wview[0..7] Width of the view in the room.
view_hview[0..7] Height of the view in the room.
view_xport[0..7] X-position of the viewport in the drawing region.
view_yport[0..7] Y-position of the viewport in the drawing region.
view_wport[0..7] Width of the viewport in the drawing region.
view_hport[0..7] Height of the viewport in the drawing region.
*/

if(ch_ball == false){
    exit
}

oob_drawX = x
oob_drawY = y

//draw player based on view

if(x > view_xview[0]+view_wview[0]+24){
    oob_drawX = view_xview[0]+view_wview[0]-32
}else if(x < view_xview[0]-24){
    oob_drawX = view_xview[0]+32
}

if(y > view_yview[0]+view_hview[0]+12-80){ //hud height = 80
    oob_drawY = view_yview[0]+view_hview[0]-32-80
}else if(y < view_yview[0]-12){
    oob_drawY = view_yview[0]+32
}

//if within view, don't draw

if(oob_drawX == x and oob_drawY == y){
    exit
}

draw_set_color(c_white)
draw_circle(oob_drawX, oob_drawY, 16, false)
draw_set_color(team_color)
draw_circle(oob_drawX, oob_drawY, 16, true)

//draw_sprite_ext(spr_player_out_bounds_arrow, -1, oob_drawX, oob_drawY, 1, 1, point_direction(view_yview[0]+(view_hview[0]/2),view_xview[0]+(view_wview[0]/2),x,y), team_color, 1)
draw_sprite_ext(spr_player_out_bounds_arrow, -1, oob_drawX, oob_drawY, 1, 1, point_direction(obj_follow_object.x, obj_follow_object.y,oob_drawX,oob_drawY), team_color, 1)

//draw thick circle

draw_circle(oob_drawX-1, oob_drawY-1, 16, true)
draw_circle(oob_drawX, oob_drawY-1, 16, true)
draw_circle(oob_drawX+1, oob_drawY-1, 16, true)
draw_circle(oob_drawX+1, oob_drawY, 16, true)
draw_circle(oob_drawX+1, oob_drawY+1, 16, true)
draw_circle(oob_drawX, oob_drawY+1, 16, true)
draw_circle(oob_drawX-1, oob_drawY+1, 16, true)
draw_circle(oob_drawX-1, oob_drawY, 16, true)

if room == rm_alt{
    //out_of_bounds_scale = .85+(y/480)*.25
    out_of_bounds_scale = .66
}else{
    out_of_bounds_scale = .66
}

headangle = 0
if(drag == 1 or (scuffling = true and st_position = 4)){ //how much the head is tipped when tackling
    if draw_direction < 22.5 or draw_direction >= 337.5{
        headangle = 315
    }
    if draw_direction < 67.5 or draw_direction >= 22.5{
        headangle = 330
    }
    if draw_direction < 255 and draw_direction >= 210{
        headangle = 330
    }
    if draw_direction < 165 and draw_direction >= 120{
        headangle = 15
    }
    if draw_direction < 210 and draw_direction >= 165{
        headangle = 30
    }
    if draw_direction < 255 and draw_direction >= 210{
        headangle = 30
    }
}

if ch_ball == true and st_position < 3 and global.ballmarker == true{
draw_sprite(spr_qc, -1, oob_drawX, oob_drawY)
}/*else{
    if tackle == false and jumping == false{
    if st_height <= 1{
        if (st_height > .80){
            //draw_sprite_ext(spr_shadow, -1, oob_drawX, oob_drawY+1, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
        }else{
            //draw_sprite_ext(spr_shadow, -1, oob_drawX, oob_drawY-6, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1);
        }
    }else{
        if st_height < 1.1{
            //draw_sprite_ext(spr_shadow, -1, oob_drawX, oob_drawY+4, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1);
        }else{
            //draw_sprite_ext(spr_shadow, -1, oob_drawX, oob_drawY+6, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1);
            }
        }
    }
}*/
if immunitycount > 0{
    draw_sprite(spr_immunity, -1, oob_drawX, oob_drawY);
}

//if jumping = false and tackle = false and (st_position == 4 or scuffling == false) or (st_position == 4 and scuffling == true){
if jumping == false and tackle == false and ((st_position != 4 and scuffling == false) or (st_position == 4)){
    if global.playerglow == true{
            draw_sprite_ext(spr_aura, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, headbandcolor[st_position], 1)
    }
if(ch_ball = true) and draw_direction < 120 and draw_direction >= 75{ //to draw behind in case player is moving UP
    if blocking = false{
        if(st_position < 3)
        {
         draw_sprite_ext(spr_quaffle_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
        }
        if(st_position == 3){
         draw_sprite_ext(spr_bludger_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
        }
    }
}

    if ch_off_broom == false or image_index < 4
    {
        if ch_off_broom == false{
            if draw_direction < 22.5 or draw_direction >= 337.5{ //draw_direction < 22.5 or draw_direction >= 337.5
                    draw_sprite_ext(spr_new_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    if blocking or drag == 1{
                        draw_sprite_ext(spr_skin_right_block, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }else{
                        draw_sprite_ext(spr_skin_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }
                    draw_sprite_ext(spr_sleeves_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
            }
            if draw_direction < 67.5 and draw_direction >= 22.5{ //draw_direction < 67.5 or draw_direction >= 22.5
                    draw_sprite_ext(spr_new_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    if blocking or drag == 1{
                        draw_sprite_ext(spr_skin_upright_block, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }else{
                        draw_sprite_ext(spr_skin_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }
                    draw_sprite_ext(spr_sleeves_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
            }
            if draw_direction < 112.5 and draw_direction >= 67.5{ //draw_direction < 120 and draw_direction >= 75
                    draw_sprite_ext(spr_new_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    if blocking or drag == 1{
                        draw_sprite_ext(spr_skin_up_block, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }else{
                        draw_sprite_ext(spr_skin_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }
                    draw_sprite_ext(spr_sleeves_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
            }
            if draw_direction < 157.5 and draw_direction >= 112.5{
                    draw_sprite_ext(spr_new_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    if blocking or drag == 1{
                        draw_sprite_ext(spr_skin_upright_block, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }else{
                        draw_sprite_ext(spr_skin_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }
                    draw_sprite_ext(spr_sleeves_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
            }
            if draw_direction < 202.5 and draw_direction >= 157.5{
                    draw_sprite_ext(spr_new_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    if blocking or drag == 1{
                        draw_sprite_ext(spr_skin_right_block, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }else{
                        draw_sprite_ext(spr_skin_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }
                    draw_sprite_ext(spr_sleeves_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
                    }
            if draw_direction < 247.5 and draw_direction >= 202.5{
                    draw_sprite_ext(spr_new_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    if blocking or drag == 1{
                        draw_sprite_ext(spr_skin_downright_block, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }else{
                        draw_sprite_ext(spr_skin_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }
                    draw_sprite_ext(spr_sleeves_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
            }
            if draw_direction < 292.5 and draw_direction >= 247.5{
                    draw_sprite_ext(spr_new_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    if blocking or drag == 1{
                        draw_sprite_ext(spr_skin_down_block, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }else{
                        draw_sprite_ext(spr_skin_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }
                    draw_sprite_ext(spr_sleeves_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
            }
            if draw_direction < 337.5 and draw_direction >= 292.5{
                    draw_sprite_ext(spr_new_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    if blocking or drag == 1{
                        draw_sprite_ext(spr_skin_down_block, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }else{
                        draw_sprite_ext(spr_skin_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    }
                    draw_sprite_ext(spr_sleeves_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
            }
        }else{
            if draw_direction < 22.5 or draw_direction >= 337.5{
                    draw_sprite_ext(spr_shorts_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1) //originall spr_nobroom_right until changed 10/27/2016 BACKUP36
                    draw_sprite_ext(spr_skin_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_legs_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_jersey_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_shoes_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 67.5 and draw_direction >= 22.5{
                    draw_sprite_ext(spr_shorts_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_skin_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_legs_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_jersey_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_shoes_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 112.5 and draw_direction >= 67.5{
                    draw_sprite_ext(spr_shorts_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_skin_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_legs_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_jersey_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_shoes_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 157.5 and draw_direction >= 112.5{
                    draw_sprite_ext(spr_shorts_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_skin_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_legs_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_jersey_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_shoes_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 202.5 and draw_direction >= 157.5{
                    draw_sprite_ext(spr_shorts_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_skin_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_legs_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_jersey_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_shoes_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 247.5 and draw_direction >= 202.5{
                    draw_sprite_ext(spr_shorts_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_skin_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_legs_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_jersey_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_shoes_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 292.5 and draw_direction >= 247.5{
                    draw_sprite_ext(spr_shorts_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_skin_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_legs_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_jersey_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_shoes_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 337.5 and draw_direction >= 292.5{
                    draw_sprite_ext(spr_shorts_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_skin_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_legs_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_jersey_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_shoes_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale*st_weight, out_of_bounds_scale*st_height, 0, c_white, 1)
                    }
            }        
        }
        //scr_draw_smallheads(sprite, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
        if ((self_id >= 0 and self_id <= 75) == false){
            draw_sprite_ext(spr_default_head, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, headangle, c_white, 1)
            draw_sprite_ext(spr_default_headband, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, headangle, headbandcolor[st_position], 1)
            if st_gender == 2 or st_gender == 0{
                draw_sprite_ext(spr_male_hair, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, headangle, scr_gethair(ch_hair), 1)
            }else{
                draw_sprite_ext(spr_female_hair, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, headangle, scr_gethair(ch_hair), 1)
            }
        }else{
            scr_draw_smallheads(self_id, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, headangle, c_white, 1)
        }
    }
}
if jumping = true or (tackle == true and scuffling == false) or (scuffling == true and st_position != 4){
    if jumping == true{
        draw_sprite_ext(spr_player_tackle, draw_direction/45, oob_drawX, oob_drawY+16, .5, 1, 0, c_black, .5)
    }else{
        draw_sprite_ext(spr_player_tackle, draw_direction/45, oob_drawX, oob_drawY+4, .5, 1, 0, c_black, .5)
    }
    if (st_position != 4 or (st_position == 4 and tackle == true)){ //if seeker and wrastling snitch! PATCH. Not confirmed
    draw_sprite_ext(spr_player_tackle, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale*st_height, 0, c_white, 1)
    draw_sprite_ext(spr_player_tackle_shirt, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale*st_height, 0, team_color, 1)
    draw_sprite_ext(spr_tackle_shorts, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale*st_height, 0, team_color_secondary, 1)
    draw_sprite_ext(spr_tackle_skin, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale*st_height, 0, scr_getskin(1), 1)
    if  ((self_id >= 0 and self_id <= 65) == false){
        draw_sprite_ext(spr_default_head, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
        draw_sprite_ext(spr_default_headband, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, headbandcolor[st_position], 1)
        if st_gender == 2 or st_gender == 0{
            draw_sprite_ext(spr_male_hair, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, scr_gethair(ch_hair), 1)
        }else{
            draw_sprite_ext(spr_female_hair, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, scr_gethair(ch_hair), 1)
        }
    }else{
        scr_draw_smallheads(self_id, draw_direction/45, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
    }
    }
}
if blocking == true and ch_ball == true and ((draw_direction < 120 and draw_direction >= 75) == false){
    if(st_position < 3){
        draw_sprite_ext(spr_ball_block, 0, oob_drawX, oob_drawY+4, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_white, 1)
    }else{
        draw_sprite_ext(spr_ball_block, 1, oob_drawX, oob_drawY+4, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_white, 1)
    }
}
/*if tackle = true and scuffling = false{
    if st_gender == 2 or st_gender == 0{
        draw_sprite_ext(spr_player_tackle, -1, oob_drawX, oob_drawY+4, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_black, .5)
        draw_sprite_ext(spr_player_tackle,-1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_white, 1)
        draw_sprite_ext(spr_mheadband_down, 2, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction-90, headbandcolor[st_position], 1)
        draw_sprite_ext(spr_jersey_down, 2, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction-90, team_color, 1)
        draw_sprite_ext(spr_mhair_up, 2, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction-90, scr_gethair(ch_hair), 1)
    }
    else{
        draw_sprite_ext(spr_female_tackle, -1, oob_drawX, oob_drawY+4, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_black, .5)
        draw_sprite_ext(spr_female_tackle,-1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_white, 1)
        draw_sprite_ext(spr_fheadband_down, 1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction-90, headbandcolor[st_position], 1)
        draw_sprite_ext(spr_fjersey_down, 1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction-90, team_color, 1)
        draw_sprite_ext(spr_fhair_up, 1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction-90, scr_gethair(ch_hair), 1)
    }
}

if scuffling = true{
    if instance_exists(obj_snitch_grab) == true and st_position == 4{
    //draw_sprite_ext(spr_player_block, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_white, 1)
    }else{
    if st_gender == 2 or st_gender == 0{
        draw_sprite_ext(spr_player_dive, -1, oob_drawX, oob_drawY+4, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_black, .5)
        draw_sprite_ext(spr_player_dive, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_white, 1)
        draw_sprite_ext(spr_mheadband_down, 1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction-90, headbandcolor[st_position], 1)
        draw_sprite_ext(spr_jersey_down, 1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction-90, team_color, 1)
        draw_sprite_ext(spr_mhair_down, 1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction-90, scr_gethair(ch_hair), 1)
    }else{
        draw_sprite_ext(spr_female_dive, -1, oob_drawX, oob_drawY+4, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_black, .5)
        draw_sprite_ext(spr_female_dive, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_white, 1)
        draw_sprite_ext(spr_fheadband_down, 4, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction-90, headbandcolor[st_position], 1)
        draw_sprite_ext(spr_fjersey_down, 4, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction-90, team_color, 1)
        draw_sprite_ext(spr_fhair_down, 4, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction-90, scr_gethair(ch_hair), 1)
        }
    }
}*/
//draw_sprite_ext(spr_headbands, st_position-1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_white, 1)
if ch_off_broom = true{
//draw_sprite_ext(spr_brooms_off, ch_broom, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_white, 1)
}
if ch_off_broom = false{
//draw_sprite_ext(spr_broom, ch_broom, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_white, 1)
}
//draw_sprite_ext(spr_hair, ch_hair, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, draw_direction, c_white, 1)
if(ch_ball = true){
    if blocking = false{
        if(st_position < 3)
        {
            if draw_direction < 22.5 or draw_direction >= 337.5{
                    draw_sprite_ext(spr_quaffle_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
            if draw_direction < 67.5 and draw_direction >= 22.5{
                    draw_sprite_ext(spr_quaffle_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
            /*if draw_direction < 120 and draw_direction >= 75{
                    draw_sprite_ext(spr_quaffle_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, scr_getskin(1), 1)
            }Draw BEHIND character*/ 
            if draw_direction < 157.5 and draw_direction >= 112.5{
                    draw_sprite_ext(spr_quaffle_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
            if draw_direction < 202.5 and draw_direction >= 157.5{
                    draw_sprite_ext(spr_quaffle_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
            if draw_direction < 247.5 and draw_direction >= 202.5{
                    draw_sprite_ext(spr_quaffle_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
            if draw_direction < 292.5 and draw_direction >= 247.5{
                    draw_sprite_ext(spr_quaffle_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
            if draw_direction < 337.5 and draw_direction >= 292.5{
                    draw_sprite_ext(spr_quaffle_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
        }
        if(st_position == 3)
        {
            if draw_direction < 22.5 or draw_direction >= 337.5{
                    draw_sprite_ext(spr_bludger_right, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
            if draw_direction < 67.5 and draw_direction >= 22.5{
                    draw_sprite_ext(spr_bludger_upright, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
            /*if draw_direction < 120 and draw_direction >= 75{
                    draw_sprite_ext(spr_quaffle_up, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, scr_getskin(1), 1)
            }Draw BEHIND character*/ 
            if draw_direction < 157.5 and draw_direction >= 112.5{
                    draw_sprite_ext(spr_bludger_upright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
            if draw_direction < 202.5 and draw_direction >= 157.5{
                    draw_sprite_ext(spr_bludger_right, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
            if draw_direction < 247.5 and draw_direction >= 202.5{
                    draw_sprite_ext(spr_bludger_downright, -1, oob_drawX, oob_drawY, -1*out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
            if draw_direction < 292.5 and draw_direction >= 247.5{
                    draw_sprite_ext(spr_bludger_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
            if draw_direction < 337.5 and draw_direction >= 292.5{
                    draw_sprite_ext(spr_bludger_down, -1, oob_drawX, oob_drawY, out_of_bounds_scale, out_of_bounds_scale, 0, c_white, 1)
            }
        }
    } 
}

if scuffling == false or st_position == 4{
draw_set_font(fnt_name)
draw_set_valign(fa_top)
draw_set_halign(fa_center)
draw_set_color(c_black)
draw_text(x-1, y-38, ch_name)
draw_text(oob_drawX, oob_drawY-37, ch_name)
draw_set_color(team_color)
draw_text(oob_drawX, oob_drawY-38, ch_name)
draw_set_color(c_black)
if global.debugmode{
draw_text(oob_drawX, oob_drawY+32, thoughts)
//draw_set_color(global.team2_color)
//draw_set_alpha(.33)
//draw_circle(oob_drawX, oob_drawY, po_radius, true)
if st_position == 1{
//draw_text(oob_drawX, oob_drawY+48, string(man.x) + ", " + string(man.y))
}
}
}
