if global.threedmode == true{
    scale = .85+(y/480)*.25
}else{
    scale = 1
}

headangle = 0
torsoangle = 0

if room == rm_prepitch_alt or room == rm_prepitch{
    if (st_position != 4 or (st_position == 4 and tackle == true)){ //if seeker and wrastling snitch! PATCH. Not confirmed
        draw_sprite_ext(spr_player_tackle, direction/45, x, y, scale, scale*st_height, 0, c_white, 1)
        draw_sprite_ext(spr_player_tackle_shirt, direction/45, x, y, scale, scale*st_height, 0, team_color, 1)
        draw_sprite_ext(spr_tackle_shorts, direction/45, x, y, scale, scale*st_height, 0, team_color_secondary, 1)
        draw_sprite_ext(spr_tackle_skin, direction/45, x, y, scale, scale*st_height, 0, scr_getskin(1), 1)
        if  ((self_id >= 0 and self_id <= 74) == false){
            draw_sprite_ext(spr_default_head, direction/45, x, y, scale, scale, 0, c_white, 1)
            draw_sprite_ext(spr_default_headband, direction/45, x, y, scale, scale, 0, headbandcolor[st_position], 1)
            if st_gender == 2 or st_gender == 0{
                draw_sprite_ext(spr_male_hair, direction/45, x, y, scale, scale, 0, scr_gethair(ch_hair), 1)
            }else{
                draw_sprite_ext(spr_female_hair, direction/45, x, y, scale, scale, 0, scr_gethair(ch_hair), 1)
            }
        }else{
                scr_draw_smallheads(self_id, direction/45, x, y, scale, scale, 0, c_white, 1)
        }
    }
    exit
}

if(st_position == 4){
    if(instance_exists(obj_seekeryeti)){ //easter egg/powerup
        if (distance_to_object(obj_seekeryeti) < 16){
            draw_sprite_ext(spr_player_eaten_skin, obj_seekeryeti.image_index, x, y, scale, scale, 0, scr_getskin(1), 1)
            draw_sprite_ext(spr_player_eaten_shirt, obj_seekeryeti.image_index, x, y, scale, scale, 0, team_color, 1)
            draw_sprite_ext(spr_player_eaten_shorts, obj_seekeryeti.image_index, x, y, scale, scale, 0, team_color_secondary, 1)
            draw_sprite_ext(spr_player_eaten_shoes, obj_seekeryeti.image_index, x, y, scale, scale, 0, c_white, 1)
            if(obj_seekeryeti.image_index < 2){ //draw head for first two frames
                if ((self_id >= 0 and self_id <= 74) == false){ //self_id is used elsewhere, make sure you check both!
                    draw_sprite_ext(spr_default_head, 4, x+10, y-11, scale, scale, headangle, c_white, 1)
                    draw_sprite_ext(spr_default_headband, 4, x+10, y-11, scale, scale, headangle, headbandcolor[st_position], 1)
                    if st_gender == 2 or st_gender == 0{
                        draw_sprite_ext(spr_male_hair, 4, x+10, y-11, scale, scale, headangle, scr_gethair(ch_hair), 1)
                    }else{
                        draw_sprite_ext(spr_female_hair, 4, x+10, y-11, scale, scale, headangle, scr_gethair(ch_hair), 1)
                    }
                }else{
                    scr_draw_smallheads(self_id, 4, x+10, y-11, scale, scale, headangle, c_white, 1)
                }
            }
            exit
        }
    }
}

if(blocking == true) and instance_exists(obj_bludger){
    //torsoangle = point_direction(x, y, instance_nearest(x, y, obj_bludger).x, instance_nearest(x, y, obj_bludger).y)
}

if st_position < 3 and ch_off_broom == false{ //player bends over to pick up ball
    if(instance_exists(obj_quaffle)){
        if(obj_quaffle.speed == 0){
            if distance_to_object(obj_quaffle) <= 16{
                if draw_direction < 22.5 or draw_direction >= 337.5{
                        torsoangle = -1*(48-((distance_to_object(obj_quaffle))*3))
                }
                if draw_direction < 67.5 and draw_direction >= 22.5{
                        torsoangle = -1*(48-((distance_to_object(obj_quaffle))*3))/2
                }
                if draw_direction < 112.5 and draw_direction >= 67.5{
                        torsoangle = 0
                }
                if draw_direction < 157.5 and draw_direction >= 112.5{
                        torsoangle = (48-((distance_to_object(obj_quaffle))*3))/2
                }
                if draw_direction < 202.5 and draw_direction >= 157.5{
                        torsoangle = 48-((distance_to_object(obj_quaffle))*3)
                }
                if draw_direction < 247.5 and draw_direction >= 202.5{
                        torsoangle = (48-((distance_to_object(obj_quaffle))*3))/2
                }
                if draw_direction < 292.5 and draw_direction >= 247.5{
                        torsoangle = 0
                }
                if draw_direction < 337.5 and draw_direction >= 292.5{
                        torsoangle = -1*(48-((distance_to_object(obj_quaffle))*3))/2
                }        
                //torsoangle = 48-((distance_to_object(obj_quaffle))*3)
            }
        }
    }
}

if st_position == 3 and ch_off_broom == false and ch_ball == false{ //player bends over to pick up ball
    if(instance_exists(obj_bludger)){
        if(instance_nearest(x, y, obj_bludger).speed == 0){
            if distance_to_object(obj_bludger) <= 16{
                if draw_direction < 22.5 or draw_direction >= 337.5{
                        torsoangle = -1*(48-((distance_to_object(obj_bludger))*3))
                }
                if draw_direction < 67.5 and draw_direction >= 22.5{
                        torsoangle = -1*(48-((distance_to_object(obj_bludger))*3))/2
                }
                if draw_direction < 112.5 and draw_direction >= 67.5{
                        torsoangle = 0
                }
                if draw_direction < 157.5 and draw_direction >= 112.5{
                        torsoangle = (48-((distance_to_object(obj_bludger))*3))/2
                }
                if draw_direction < 202.5 and draw_direction >= 157.5{
                        torsoangle = 48-((distance_to_object(obj_bludger))*3)
                }
                if draw_direction < 247.5 and draw_direction >= 202.5{
                        torsoangle = (48-((distance_to_object(obj_bludger))*3))/2
                }
                if draw_direction < 292.5 and draw_direction >= 247.5{
                        torsoangle = 0
                }
                if draw_direction < 337.5 and draw_direction >= 292.5{
                        torsoangle = -1*(48-((distance_to_object(obj_bludger))*3))/2
                }        
                //torsoangle = 48-((distance_to_object(obj_quaffle))*3)
            }
        }
    }
}

if(drag != 0 or (scuffling = true and st_position = 4)){ //how much the head is tipped when tackling
    image_speed = st_power/10
    if draw_direction < 22.5 or draw_direction >= 337.5{ //right
        headangle = 315 //+ (ceil(windup*4))
    }
    if draw_direction < 67.5 or draw_direction >= 22.5{ //upright
        headangle = 330 //+ (ceil(windup*4))
    }
    if draw_direction < 112.5 and draw_direction >= 67.5{ //up
        headangle = 330 //+ (ceil(windup*4))
    }
    if draw_direction < 157.5 and draw_direction >= 112.5{ //upleft
        headangle = 15 //- (ceil(windup*4))
    }
    if draw_direction < 202.5 and draw_direction >= 157.5{ //left
        headangle = 30 //+ (ceil(windup*4))
    }
    if draw_direction < 247.5 and draw_direction >= 202.5{ //downleft
        headangle = 15 //- (ceil(windup*4))
    }
    if draw_direction < 292.5 and draw_direction >= 247.5{ //down
        headangle = 330 //- (ceil(windup*4))
    }
    if draw_direction < 337.5 or draw_direction >= 292.5{ //downright
        headangle = 15 //- (ceil(windup*4))
    }

    if(contact_direction != -1){
        if contact_direction < 22.5 or draw_direction >= 337.5{ //right
            headangle = 315 //+ (ceil(windup*4))
        }
        if contact_direction < 67.5 or draw_direction >= 22.5{ //upright
            headangle = 330 //+ (ceil(windup*4))
        }
        if contact_direction < 112.5 and draw_direction >= 67.5{ //up
            headangle = 330 //+ (ceil(windup*4))
        }
        if contact_direction < 157.5 and draw_direction >= 112.5{ //upleft
            headangle = 15 //- (ceil(windup*4))
        }
        if contact_direction < 202.5 and draw_direction >= 157.5{ //left
            headangle = 30 //+ (ceil(windup*4))
        }
        if contact_direction < 247.5 and draw_direction >= 202.5{ //downleft
            headangle = 15 //- (ceil(windup*4))
        }
        if contact_direction < 292.5 and draw_direction >= 247.5{ //down
            headangle = 330 //- (ceil(windup*4))
        }
        if contact_direction < 337.5 or draw_direction >= 292.5{ //downright
            headangle = 15 //- (ceil(windup*4))
        }
    }
}

if(windup > 0){
    if(windup <= 5){
        if draw_direction < 22.5 or draw_direction >= 337.5{ //right
            headangle = headangle + (ceil(windup*4))
        }
        if draw_direction < 67.5 or draw_direction >= 22.5{ //upright
            headangle = headangle + (ceil(windup*2))
        }
        if draw_direction < 112.5 and draw_direction >= 67.5{ //up
            headangle = headangle - (ceil(windup*2))
        }
        if draw_direction < 157.5 and draw_direction >= 112.5{ //upleft
            headangle = headangle - (ceil(windup*2))
        }
        if draw_direction < 202.5 and draw_direction >= 157.5{ //left
            headangle = headangle - (ceil(windup*4))
        }
        if draw_direction < 247.5 and draw_direction >= 202.5{ //downleft
            headangle = headangle - (ceil(windup*2))
        }
        if draw_direction < 292.5 and draw_direction >= 247.5{ //down
            headangle = headangle - (ceil(windup*2))
        }
        if draw_direction < 337.5 or draw_direction >= 292.5{ //downright
            headangle = headangle + (ceil(windup*2))
        }    
    }else{
        if draw_direction < 22.5 or draw_direction >= 337.5{ //right
            headangle = headangle + (20)
        }
        if draw_direction < 67.5 or draw_direction >= 22.5{ //upright
            headangle = headangle + (10)
        }
        if draw_direction < 112.5 and draw_direction >= 67.5{ //up
            headangle = headangle - (10)
        }
        if draw_direction < 157.5 and draw_direction >= 112.5{ //upleft
            headangle = headangle - (10)
        }
        if draw_direction < 202.5 and draw_direction >= 157.5{ //left
            headangle = headangle - (20)
        }
        if draw_direction < 247.5 and draw_direction >= 202.5{ //downleft
            headangle = headangle - (10)
        }
        if draw_direction < 292.5 and draw_direction >= 247.5{ //down
            headangle = headangle + (10)
        }
        if draw_direction < 337.5 or draw_direction >= 292.5{ //downright
            headangle = headangle + (10)
        }        
    }
}

torsoangle = 0

headangle = headangle + torsoangle

if(powerup > 0){
    draw_sprite(spr_player_powerup, powerup, x, y)
}

if ch_ball == true and st_position < 3 and global.ballmarker == true{
    draw_sprite(spr_qc, -1, x, y)
}else{
    if tackle == false and jumping == false{
        if st_height <= 1{
            if (st_height > .80){
                draw_sprite_ext(spr_shadow, -1, x, y+1, scale, scale, 0, c_white, 1)
            }else{
                draw_sprite_ext(spr_shadow, -1, x, y-6, scale, scale, 0, c_white, 1);
            }
        }else{
            if st_height < 1.1{
                draw_sprite_ext(spr_shadow, -1, x, y+4, scale, scale, 0, c_white, 1);
            }else{
                draw_sprite_ext(spr_shadow, -1, x, y+6, scale, scale, 0, c_white, 1);
            }
        }
    }
}

if immunitycount > 0{
    draw_sprite(spr_immunity, -1, x, y);
}

//if jumping = false and tackle = false and (st_position == 4 or scuffling == false) or (st_position == 4 and scuffling == true){
if jumping == false and tackle == false and ((st_position != 4 and scuffling == false) or (st_position == 4)){
    if global.playerglow == true{
            draw_sprite_ext(spr_aura, -1, x, y, scale, scale, 0, headbandcolor[st_position], 1)
    }
    
if(ch_ball = true) and draw_direction < 112.5 and draw_direction >= 67.5{ //to draw behind in case player is moving UP
    if blocking = false and windup == 0{
        if(st_position < 3)
        {
         draw_sprite_ext(spr_quaffle_up, -1, x, y, scale, scale, 0, c_white, 1)
        }
        if(st_position == 3){
         draw_sprite_ext(spr_bludger_up, -1, x, y, scale, scale, 0, c_white, 1)
        }
        
    }else if windup > 0{
        if(windup <= 5){
            if(st_position < 3)
            {
             draw_sprite_ext(spr_throw_up_quaffle, windup, x, y, scale, scale, 0, c_white, 1)
            }
            if(st_position == 3){
             draw_sprite_ext(spr_throw_up_bludger, windup, x, y, scale, scale, 0, c_white, 1)
            }    
        }else{
            if(st_position < 3)
            {
             draw_sprite_ext(spr_throw_up_quaffle, 5, x, y, scale, scale, 0, c_white, 1)
            }
            if(st_position == 3){
             draw_sprite_ext(spr_throw_up_bludger, 5, x, y, scale, scale, 0, c_white, 1)
            }         
        }
    }
}
if(ch_ball = true) and draw_direction < 157.5 and draw_direction >= 112.5{ //to draw behind in case player is moving UP
    if blocking = false and windup == 0{
        if(st_position < 3)
        {
         draw_sprite_ext(spr_quaffle_upright, -1, x, y, -1*scale, scale, 0, c_white, 1)
        }
        if(st_position == 3){
         draw_sprite_ext(spr_bludger_upright, -1, x, y, -1*scale, scale, 0, c_white, 1)
        }
        
    }else if windup > 0{
        if(windup <= 5){
            if(st_position < 3)
            {
             draw_sprite_ext(spr_throw_upright_quaffle, windup, x, y, -1*scale, scale, 0, c_white, 1)
            }
            if(st_position == 3){
             draw_sprite_ext(spr_throw_upright_bludger, windup, x, y, -1*scale, scale, 0, c_white, 1)
            }    
        }else{
            if(st_position < 3)
            {
             draw_sprite_ext(spr_throw_upright_quaffle, 5, x, y, -1*scale, scale, 0, c_white, 1)
            }
            if(st_position == 3){
             draw_sprite_ext(spr_throw_upright_bludger, 5, x, y, -1*scale, scale, 0, c_white, 1)
            }         
        }
    }
}


    if ch_off_broom == false or image_index < 4
    {
        if ch_off_broom == false{
            if draw_direction < 22.5 or draw_direction >= 337.5{ //draw_direction < 22.5 or draw_direction >= 337.5
                    draw_sprite_ext(spr_new_right, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_right, -1, x, y, scale*st_weight, scale*st_height, torsoangle, team_color, 1)
                    if blocking or drag != 0{
                        draw_sprite_ext(spr_skin_right_block, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_right, 0, x+(torsoangle/4), y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    }else if windup > 0 and ch_ball == true{
                        if(windup <= 5){
                            draw_sprite_ext(spr_throw_right, windup + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1) //throw_leway will set to 15 after a ball is thrown, and count down to 0
                            draw_sprite_ext(spr_sleeves_throw_right, windup + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                        }else{
                            draw_sprite_ext(spr_throw_right, 5 + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1) //throw_leway will set to 15 after a ball is thrown, and count down to 0
                            draw_sprite_ext(spr_sleeves_throw_right, 5 + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)                        
                        }
                    }else{
                        draw_sprite_ext(spr_skin_right, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_right, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, team_color_secondary, 1)
                    }
                    draw_sprite_ext(spr_legs_right, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_right, -1, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_shoes_right, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
            }
            if draw_direction < 67.5 and draw_direction >= 22.5{ //draw_direction < 67.5 or draw_direction >= 22.5
                    draw_sprite_ext(spr_new_upright, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_upright, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, team_color, 1)
                    if blocking or drag != 0{
                        draw_sprite_ext(spr_skin_upright_block, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_upright, 0, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    }else if windup > 0 and ch_ball == true{
                        if(windup <= 5){
                            draw_sprite_ext(spr_throw_upright, windup + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_upright, windup + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                        }else{
                            draw_sprite_ext(spr_throw_upright, 5 + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_upright, 5 + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)                        
                        }
                    }else{
                        draw_sprite_ext(spr_skin_upright, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_upright, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, team_color_secondary, 1)
                    }
                    draw_sprite_ext(spr_legs_upright, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_upright, -1, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_shoes_upright, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
            }
            if draw_direction < 112.5 and draw_direction >= 67.5{ //draw_direction < 120 and draw_direction >= 75
                    draw_sprite_ext(spr_new_up, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_up, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, team_color, 1)
                    if blocking or drag != 0{
                        draw_sprite_ext(spr_skin_up_block, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_up, 0, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    }else if windup > 0 and ch_ball == true{
                        if(windup <= 5){
                            draw_sprite_ext(spr_throw_up, windup + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_up, windup + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                        }else{
                            draw_sprite_ext(spr_throw_up, 5 + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_up, 5 + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)                        
                        }
                    }else{
                        draw_sprite_ext(spr_skin_up, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_up, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, team_color_secondary, 1)
                    }
                    draw_sprite_ext(spr_legs_up, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_up, -1, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_shoes_up, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
            }
            if draw_direction < 157.5 and draw_direction >= 112.5{
                    draw_sprite_ext(spr_new_upright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_upright, -1, x+(torsoangle/4), y, -1*scale*st_weight, scale*st_height, torsoangle, team_color, 1)
                    if blocking or drag != 0{
                        draw_sprite_ext(spr_skin_upright_block, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_upright, 0, x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    }else if windup > 0 and ch_ball == true{
                        if(windup <= 5){
                            draw_sprite_ext(spr_throw_upright, windup + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_upright, windup + (throw_leway/3), x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                        }else{
                            draw_sprite_ext(spr_throw_upright, 5 + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_upright, 5 + (throw_leway/3), x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)                        
                        }
                    }else{
                        draw_sprite_ext(spr_skin_upright, -1, x+(torsoangle/4), y, -1*scale*st_weight, scale*st_height, torsoangle, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_upright, -1, x+(torsoangle/4), y, -1*scale*st_weight, scale*st_height, torsoangle, team_color_secondary, 1)
                    }
                    draw_sprite_ext(spr_legs_upright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_upright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_shoes_upright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, c_white, 1)
            }
            if draw_direction < 202.5 and draw_direction >= 157.5{
                    draw_sprite_ext(spr_new_right, -1, x, y, -1*scale*st_weight, scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_right, -1, x+(torsoangle/4), y, -1*scale*st_weight, scale*st_height, torsoangle, team_color, 1)
                    if blocking or drag != 0{
                        draw_sprite_ext(spr_skin_right_block, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_right, 0, x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    }else if windup > 0 and ch_ball == true{
                        if(windup <= 5){
                            draw_sprite_ext(spr_throw_right, windup + (throw_leway/3), x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_right, windup + (throw_leway/3), x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                        }else{
                            draw_sprite_ext(spr_throw_right, 5 + (throw_leway/3), x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_right, 5 + (throw_leway/3), x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)                        
                        }
                    }else{
                        draw_sprite_ext(spr_skin_right, -1, x+(torsoangle/4), y, -1*scale*st_weight, scale*st_height, torsoangle, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_right, -1, x+(torsoangle/4), y, -1*scale*st_weight, scale*st_height, torsoangle, team_color_secondary, 1)
                    }
                    draw_sprite_ext(spr_legs_right, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_right, -1, x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_shoes_right, -1, x, y, -1*scale*st_weight, scale*st_height, 0, c_white, 1)
                    }
            if draw_direction < 247.5 and draw_direction >= 202.5{
                    draw_sprite_ext(spr_new_downright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_downright, -1, x+(torsoangle/4), y, -1*scale*st_weight, scale*st_height, torsoangle, team_color, 1)
                    if blocking or drag != 0{
                        draw_sprite_ext(spr_skin_downright_block, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_downright, 0, x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    }else if windup > 0 and ch_ball == true{
                        if(windup <= 5){
                            draw_sprite_ext(spr_throw_upright, windup + (throw_leway/3), x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_downright, windup + (throw_leway/3), x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                        }else{
                            draw_sprite_ext(spr_throw_upright, 5 + (throw_leway/3), x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_downright, 5 + (throw_leway/3), x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)                        
                        }
                    }else{
                        draw_sprite_ext(spr_skin_downright, -1, x+(torsoangle/4), y, -1*scale*st_weight, scale*st_height, torsoangle, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_downright, -1, x+(torsoangle/4), y, -1*scale*st_weight, scale*st_height, torsoangle, team_color_secondary, 1)
                    }
                    draw_sprite_ext(spr_legs_downright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_downright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_shoes_downright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, c_white, 1)
            }
            if draw_direction < 292.5 and draw_direction >= 247.5{
                    draw_sprite_ext(spr_new_down, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_down, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, team_color, 1)
                    if blocking or drag != 0{
                        draw_sprite_ext(spr_skin_down_block, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_down, 0, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    }else if windup > 0 and ch_ball == true{
                        if(windup <= 5){
                            draw_sprite_ext(spr_throw_down, windup + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_down, windup + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                        }else{
                            draw_sprite_ext(spr_throw_down, 5 + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_down, 5 + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)                        
                        }
                    }else{
                        draw_sprite_ext(spr_skin_down, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_down, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, team_color_secondary, 1)
                    }
                    draw_sprite_ext(spr_legs_down, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_down, -1, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_shoes_down, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
            }
            if draw_direction < 337.5 and draw_direction >= 292.5{
                    draw_sprite_ext(spr_new_downright, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    draw_sprite_ext(spr_jersey_downright, -1, x, y, scale*st_weight, scale*st_height, torsoangle, team_color, 1)
                    if blocking or drag != 0{
                        draw_sprite_ext(spr_skin_downright_block, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_downright, 0, x+(torsoangle/4), y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    }else if windup > 0 and ch_ball == true{
                        if(windup <= 5){
                            draw_sprite_ext(spr_throw_downright, windup + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_downright, windup + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                        }else{
                            draw_sprite_ext(spr_throw_downright, 5 + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                            draw_sprite_ext(spr_sleeves_throw_downright, 5 + (throw_leway/3), x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)                        
                        }
                    }else{
                        draw_sprite_ext(spr_skin_downright, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, scr_getskin(1), 1)
                        draw_sprite_ext(spr_sleeves_downright, -1, x+(torsoangle/4), y, scale*st_weight, scale*st_height, torsoangle, team_color_secondary, 1)
                    }
                    draw_sprite_ext(spr_legs_downright, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shorts_downright, -1, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_shoes_downright, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
            }
        }else{ //player has been knocked out of play, dismounts their room, and runs back
            if draw_direction < 22.5 or draw_direction >= 337.5{
                    draw_sprite_ext(spr_shorts_right, -1, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1) //originall spr_nobroom_right until changed 10/27/2016 BACKUP36
                    draw_sprite_ext(spr_legs_right, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_right, -1, x, y, scale*st_weight, scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_jersey_right, -1, x, y, scale*st_weight, scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_skin_right, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shoes_right, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_right, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 67.5 and draw_direction >= 22.5{
                    draw_sprite_ext(spr_shorts_upright, -1, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_upright, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_upright, -1, x, y, scale*st_weight, scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_jersey_upright, -1, x, y, scale*st_weight, scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_skin_upright, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shoes_upright, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_upright, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 112.5 and draw_direction >= 67.5{
                    draw_sprite_ext(spr_shorts_up, -1, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_up, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_up, -1, x, y, scale*st_weight, scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_jersey_up, -1, x, y, scale*st_weight, scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_skin_up, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shoes_up, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_up, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 157.5 and draw_direction >= 112.5{
                    draw_sprite_ext(spr_shorts_upright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_upright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_upright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_jersey_upright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_skin_upright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shoes_upright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_upright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 202.5 and draw_direction >= 157.5{
                    draw_sprite_ext(spr_shorts_right, -1, x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_right, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_right, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_jersey_right, -1, x, y, -1*scale*st_weight, scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_skin_right, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shoes_right, -1, x, y, -1*scale*st_weight, scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_right, -1, x, y, -1*scale*st_weight, scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 247.5 and draw_direction >= 202.5{
                    draw_sprite_ext(spr_shorts_downright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_downright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_downright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_jersey_downright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_skin_downright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shoes_downright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_downright, -1, x, y, -1*scale*st_weight, scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 292.5 and draw_direction >= 247.5{
                    draw_sprite_ext(spr_shorts_down, -1, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_down, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_down, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_jersey_down, -1, x, y, scale*st_weight, scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_skin_down, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shoes_down, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_down, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    }
            }
            if draw_direction < 337.5 and draw_direction >= 292.5{
                    draw_sprite_ext(spr_shorts_downright, -1, x, y, scale*st_weight, scale*st_height, 0, team_color_secondary, 1)
                    draw_sprite_ext(spr_legs_downright, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_sleeves_downright, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_jersey_downright, -1, x, y, scale*st_weight, scale*st_height, 0, team_color, 1)
                    draw_sprite_ext(spr_skin_downright, -1, x, y, scale*st_weight, scale*st_height, 0, scr_getskin(1), 1)
                    draw_sprite_ext(spr_shoes_downright, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    if ch_broom_drop == false{
                        draw_sprite_ext(spr_broom_downright, -1, x, y, scale*st_weight, scale*st_height, 0, c_white, 1)
                    }
            }        
        }
        //scr_draw_smallheads(sprite, draw_direction/45, x, y, scale, scale, 0, c_white, 1)
        if ((self_id >= 0 and self_id <= 74) == false){ //self_id is used elsewhere, make sure you check both!
            draw_sprite_ext(spr_default_head, draw_direction/45, x, y, scale, scale, headangle, c_white, 1)
            draw_sprite_ext(spr_default_headband, draw_direction/45, x, y, scale, scale, headangle, headbandcolor[st_position], 1)
            if st_gender == 2 or st_gender == 0{
                draw_sprite_ext(spr_male_hair, draw_direction/45, x, y, scale, scale, headangle, scr_gethair(ch_hair), 1)
            }else{
                draw_sprite_ext(spr_female_hair, draw_direction/45, x, y, scale, scale, headangle, scr_gethair(ch_hair), 1)
            }
        }else{
            scr_draw_smallheads(self_id, draw_direction/45, x, y, scale, scale, headangle, c_white, 1)
        }
    }
}
if jumping = true or (tackle == true and scuffling == false) or (scuffling == true and st_position != 4){
    if jumping == true{
        draw_sprite_ext(spr_player_tackle, draw_direction/45, x, y+16, .5, 1, 0, c_black, .5)
    }else{
        draw_sprite_ext(spr_player_tackle, draw_direction/45, x, y+4, .5, 1, 0, c_black, .5)
    }
    if (st_position != 4 or (st_position == 4 and tackle == true)){ //if seeker and wrastling snitch! PATCH. Not confirmed
        draw_sprite_ext(spr_player_tackle, draw_direction/45, x, y, scale, scale*st_height, 0, c_white, 1)
        draw_sprite_ext(spr_player_tackle_shirt, draw_direction/45, x, y, scale, scale*st_height, 0, team_color, 1)
        draw_sprite_ext(spr_tackle_shorts, draw_direction/45, x, y, scale, scale*st_height, 0, team_color_secondary, 1)
        draw_sprite_ext(spr_tackle_skin, draw_direction/45, x, y, scale, scale*st_height, 0, scr_getskin(1), 1)
        if  ((self_id >= 0 and self_id <= 74) == false){
            draw_sprite_ext(spr_default_head, draw_direction/45, x, y, scale, scale, 0, c_white, 1)
            draw_sprite_ext(spr_default_headband, draw_direction/45, x, y, scale, scale, 0, headbandcolor[st_position], 1)
            if st_gender == 2 or st_gender == 0{
                draw_sprite_ext(spr_male_hair, draw_direction/45, x, y, scale, scale, 0, scr_gethair(ch_hair), 1)
            }else{
                draw_sprite_ext(spr_female_hair, draw_direction/45, x, y, scale, scale, 0, scr_gethair(ch_hair), 1)
            }
        }else{
                scr_draw_smallheads(self_id, draw_direction/45, x, y, scale, scale, 0, c_white, 1)
        }
    }
}

if blocking == true and ch_ball == true and ((draw_direction < 120 and draw_direction >= 75) == false){
    if(st_position < 3){
        draw_sprite_ext(spr_ball_block, 0, x, y+4, scale, scale, draw_direction, c_white, 1)
    }else{
        draw_sprite_ext(spr_ball_block, 1, x, y+4, scale, scale, draw_direction, c_white, 1)
    }
}



/*if tackle = true and scuffling = false{
    if st_gender == 2 or st_gender == 0{
        draw_sprite_ext(spr_player_tackle, -1, x, y+4, scale, scale, draw_direction, c_black, .5)
        draw_sprite_ext(spr_player_tackle,-1, x, y, scale, scale, draw_direction, c_white, 1)
        draw_sprite_ext(spr_mheadband_down, 2, x, y, scale, scale, draw_direction-90, headbandcolor[st_position], 1)
        draw_sprite_ext(spr_jersey_down, 2, x, y, scale, scale, draw_direction-90, team_color, 1)
        draw_sprite_ext(spr_mhair_up, 2, x, y, scale, scale, draw_direction-90, scr_gethair(ch_hair), 1)
    }
    else{
        draw_sprite_ext(spr_female_tackle, -1, x, y+4, scale, scale, draw_direction, c_black, .5)
        draw_sprite_ext(spr_female_tackle,-1, x, y, scale, scale, draw_direction, c_white, 1)
        draw_sprite_ext(spr_fheadband_down, 1, x, y, scale, scale, draw_direction-90, headbandcolor[st_position], 1)
        draw_sprite_ext(spr_fjersey_down, 1, x, y, scale, scale, draw_direction-90, team_color, 1)
        draw_sprite_ext(spr_fhair_up, 1, x, y, scale, scale, draw_direction-90, scr_gethair(ch_hair), 1)
    }
}

if scuffling = true{
    if instance_exists(obj_snitch_grab) == true and st_position == 4{
    //draw_sprite_ext(spr_player_block, -1, x, y, scale, scale, draw_direction, c_white, 1)
    }else{
    if st_gender == 2 or st_gender == 0{
        draw_sprite_ext(spr_player_dive, -1, x, y+4, scale, scale, draw_direction, c_black, .5)
        draw_sprite_ext(spr_player_dive, -1, x, y, scale, scale, draw_direction, c_white, 1)
        draw_sprite_ext(spr_mheadband_down, 1, x, y, scale, scale, draw_direction-90, headbandcolor[st_position], 1)
        draw_sprite_ext(spr_jersey_down, 1, x, y, scale, scale, draw_direction-90, team_color, 1)
        draw_sprite_ext(spr_mhair_down, 1, x, y, scale, scale, draw_direction-90, scr_gethair(ch_hair), 1)
    }else{
        draw_sprite_ext(spr_female_dive, -1, x, y+4, scale, scale, draw_direction, c_black, .5)
        draw_sprite_ext(spr_female_dive, -1, x, y, scale, scale, draw_direction, c_white, 1)
        draw_sprite_ext(spr_fheadband_down, 4, x, y, scale, scale, draw_direction-90, headbandcolor[st_position], 1)
        draw_sprite_ext(spr_fjersey_down, 4, x, y, scale, scale, draw_direction-90, team_color, 1)
        draw_sprite_ext(spr_fhair_down, 4, x, y, scale, scale, draw_direction-90, scr_gethair(ch_hair), 1)
        }
    }
}*/
//draw_sprite_ext(spr_headbands, st_position-1, x, y, scale, scale, draw_direction, c_white, 1)
if ch_off_broom = true{
//draw_sprite_ext(spr_brooms_off, ch_broom, x, y, scale, scale, draw_direction, c_white, 1)
}
if ch_off_broom = false{
//draw_sprite_ext(spr_broom, ch_broom, x, y, scale, scale, draw_direction, c_white, 1)
}
//draw_sprite_ext(spr_hair, ch_hair, x, y, scale, scale, draw_direction, c_white, 1)
if(ch_ball = true){
    if blocking = false and windup == 0{
        if(st_position < 3)
        {
            if draw_direction < 22.5 or draw_direction >= 337.5{
                    draw_sprite_ext(spr_quaffle_right, -1, x, y, scale, scale, 0, c_white, 1)
            }
            if draw_direction < 67.5 and draw_direction >= 22.5{
                    draw_sprite_ext(spr_quaffle_upright, -1, x, y, scale, scale, 0, c_white, 1)
            }
            /*if draw_direction < 112.5 and draw_direction >= 67.5{
                    draw_sprite_ext(spr_quaffle_up, -1, x, y, scale, scale, 0, scr_getskin(1), 1)
            }Draw BEHIND character*/ 
            if draw_direction < 157.5 and draw_direction >= 112.5{
                    draw_sprite_ext(spr_quaffle_upright, -1, x, y, -1*scale, scale, 0, c_white, 1)
            }
            if draw_direction < 202.5 and draw_direction >= 157.5{
                    draw_sprite_ext(spr_quaffle_right, -1, x, y, -1*scale, scale, 0, c_white, 1)
            }
            if draw_direction < 247.5 and draw_direction >= 202.5{
                    draw_sprite_ext(spr_quaffle_downright, -1, x, y, -1*scale, scale, 0, c_white, 1)
            }
            if draw_direction < 292.5 and draw_direction >= 247.5{
                    draw_sprite_ext(spr_quaffle_down, -1, x, y, scale, scale, 0, c_white, 1)
            }
            if draw_direction < 337.5 and draw_direction >= 292.5{
                    draw_sprite_ext(spr_quaffle_down, -1, x, y, scale, scale, 0, c_white, 1)
            }
        }
        if(st_position == 3)
        {
            if draw_direction < 22.5 or draw_direction >= 337.5{
                    draw_sprite_ext(spr_bludger_right, -1, x, y, scale, scale, 0, c_white, 1)
            }
            if draw_direction < 67.5 and draw_direction >= 22.5{
                    draw_sprite_ext(spr_bludger_upright, -1, x, y, scale, scale, 0, c_white, 1)
            }
            /*if draw_direction < 120 and draw_direction >= 75{
                    draw_sprite_ext(spr_quaffle_up, -1, x, y, scale, scale, 0, scr_getskin(1), 1)
            }Draw BEHIND character*/ 
            if draw_direction < 157.5 and draw_direction >= 112.5{
                    draw_sprite_ext(spr_bludger_upright, -1, x, y, -1*scale, scale, 0, c_white, 1)
            }
            if draw_direction < 202.5 and draw_direction >= 157.5{
                    draw_sprite_ext(spr_bludger_right, -1, x, y, -1*scale, scale, 0, c_white, 1)
            }
            if draw_direction < 247.5 and draw_direction >= 202.5{
                    draw_sprite_ext(spr_bludger_downright, -1, x, y, -1*scale, scale, 0, c_white, 1)
            }
            if draw_direction < 292.5 and draw_direction >= 247.5{
                    draw_sprite_ext(spr_bludger_down, -1, x, y, scale, scale, 0, c_white, 1)
            }
            if draw_direction < 337.5 and draw_direction >= 292.5{
                    draw_sprite_ext(spr_bludger_downright, -1, x, y, scale, scale, 0, c_white, 1)
            }
        }
    }else if windup > 0{
        if(windup <= 5){
            if(st_position < 3)
            {
                if draw_direction < 22.5 or draw_direction >= 337.5{
                        draw_sprite_ext(spr_throw_right_quaffle, windup, x, y, scale, scale, 0, c_white, 1)
                }
                if draw_direction < 67.5 and draw_direction >= 22.5{
                        draw_sprite_ext(spr_throw_upright_quaffle, windup, x, y, scale, scale, 0, c_white, 1)
                }
                /*if draw_direction < 112.5 and draw_direction >= 67.5{
                        draw_sprite_ext(spr_quaffle_up, -1, x, y, scale, scale, 0, scr_getskin(1), 1)
                }Draw BEHIND character*/ 
                if draw_direction < 157.5 and draw_direction >= 112.5{
                        draw_sprite_ext(spr_throw_upright_quaffle, windup, x, y, -1*scale, scale, 0, c_white, 1)
                }
                if draw_direction < 202.5 and draw_direction >= 157.5{
                        draw_sprite_ext(spr_throw_right_quaffle, windup, x, y, -1*scale, scale, 0, c_white, 1)
                }
                if draw_direction < 247.5 and draw_direction >= 202.5{
                        draw_sprite_ext(spr_throw_downright_quaffle, windup, x, y, -1*scale, scale, 0, c_white, 1)
                }
                if draw_direction < 292.5 and draw_direction >= 247.5{
                        draw_sprite_ext(spr_throw_down_quaffle, windup, x, y, scale, scale, 0, c_white, 1)
                }
                if draw_direction < 337.5 and draw_direction >= 292.5{
                        draw_sprite_ext(spr_throw_downright_quaffle, windup, x, y, scale, scale, 0, c_white, 1)
                }
            }
            if(st_position == 3)
            {
                if draw_direction < 22.5 or draw_direction >= 337.5{
                        draw_sprite_ext(spr_throw_right_bludger, windup, x, y, scale, scale, 0, c_white, 1)
                }
                if draw_direction < 67.5 and draw_direction >= 22.5{
                        draw_sprite_ext(spr_throw_upright_bludger, windup, x, y, scale, scale, 0, c_white, 1)
                }
                /*if draw_direction < 112.5 and draw_direction >= 67.5{
                        draw_sprite_ext(spr_quaffle_up, -1, x, y, scale, scale, 0, scr_getskin(1), 1)
                }Draw BEHIND character*/ 
                if draw_direction < 157.5 and draw_direction >= 112.5{
                        draw_sprite_ext(spr_throw_upright_bludger, windup, x, y, -1*scale, scale, 0, c_white, 1)
                }
                if draw_direction < 202.5 and draw_direction >= 157.5{
                        draw_sprite_ext(spr_throw_right_bludger, windup, x, y, -1*scale, scale, 0, c_white, 1)
                }
                if draw_direction < 247.5 and draw_direction >= 202.5{
                        draw_sprite_ext(spr_throw_downright_bludger, windup, x, y, -1*scale, scale, 0, c_white, 1)
                }
                if draw_direction < 292.5 and draw_direction >= 247.5{
                        draw_sprite_ext(spr_throw_down_bludger, windup, x, y, scale, scale, 0, c_white, 1)
                }
                if draw_direction < 337.5 and draw_direction >= 292.5{
                        draw_sprite_ext(spr_throw_downright_bludger, windup, x, y, scale, scale, 0, c_white, 1)
                }
            }
        }else{
            if(st_position < 3)
            {
                if draw_direction < 22.5 or draw_direction >= 337.5{
                        draw_sprite_ext(spr_throw_right_quaffle, 5, x, y, scale, scale, 0, c_white, 1)
                }
                if draw_direction < 67.5 and draw_direction >= 22.5{
                        draw_sprite_ext(spr_throw_upright_quaffle, 5, x, y, scale, scale, 0, c_white, 1)
                }
                /*if draw_direction < 112.5 and draw_direction >= 67.5{
                        draw_sprite_ext(spr_quaffle_up, -1, x, y, scale, scale, 0, scr_getskin(1), 1)
                }Draw BEHIND character*/ 
                if draw_direction < 157.5 and draw_direction >= 112.5{
                        draw_sprite_ext(spr_throw_upright_quaffle, 5, x, y, -1*scale, scale, 0, c_white, 1)
                }
                if draw_direction < 202.5 and draw_direction >= 157.5{
                        draw_sprite_ext(spr_throw_right_quaffle, 5, x, y, -1*scale, scale, 0, c_white, 1)
                }
                if draw_direction < 247.5 and draw_direction >= 202.5{
                        draw_sprite_ext(spr_throw_downright_quaffle, 5, x, y, -1*scale, scale, 0, c_white, 1)
                }
                if draw_direction < 292.5 and draw_direction >= 247.5{
                        draw_sprite_ext(spr_throw_down_quaffle, 5, x, y, scale, scale, 0, c_white, 1)
                }
                if draw_direction < 337.5 and draw_direction >= 292.5{
                        draw_sprite_ext(spr_throw_downright_quaffle, 5, x, y, scale, scale, 0, c_white, 1)
                }
            }
            if(st_position == 3)
            {
                if draw_direction < 22.5 or draw_direction >= 337.5{
                        draw_sprite_ext(spr_throw_right_bludger, 5, x, y, scale, scale, 0, c_white, 1)
                }
                if draw_direction < 67.5 and draw_direction >= 22.5{
                        draw_sprite_ext(spr_throw_upright_bludger, 5, x, y, scale, scale, 0, c_white, 1)
                }
                /*if draw_direction < 112.5 and draw_direction >= 67.5{
                        draw_sprite_ext(spr_quaffle_up, -1, x, y, scale, scale, 0, scr_getskin(1), 1)
                }Draw BEHIND character*/ 
                if draw_direction < 157.5 and draw_direction >= 112.5{
                        draw_sprite_ext(spr_throw_upright_bludger, 5, x, y, -1*scale, scale, 0, c_white, 1)
                }
                if draw_direction < 202.5 and draw_direction >= 157.5{
                        draw_sprite_ext(spr_throw_right_bludger, 5, x, y, -1*scale, scale, 0, c_white, 1)
                }
                if draw_direction < 247.5 and draw_direction >= 202.5{
                        draw_sprite_ext(spr_throw_downright_bludger, 5, x, y, -1*scale, scale, 0, c_white, 1)
                }
                if draw_direction < 292.5 and draw_direction >= 247.5{
                        draw_sprite_ext(spr_throw_down_bludger, 5, x, y, scale, scale, 0, c_white, 1)
                }
                if draw_direction < 337.5 and draw_direction >= 292.5{
                        draw_sprite_ext(spr_throw_downright_bludger, 5, x, y, scale, scale, 0, c_white, 1)
                }
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
    draw_text(x, y-37, ch_name)
    draw_set_color(team_color)
    draw_text(x, y-38, ch_name)
    draw_set_color(c_black)
    if global.debugmode{
        draw_text(x, y+32, thoughts)
        //draw_set_color(global.team2_color)
        //draw_set_alpha(.33)
        //draw_circle(x, y, po_radius, true)
        if st_position == 1{
            //draw_text(x, y+48, string(man.x) + ", " + string(man.y))
        }
    }
}
