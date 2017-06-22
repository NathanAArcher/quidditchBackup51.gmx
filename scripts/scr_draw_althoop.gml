if sprite_index == spr_baby_hoop_wobble{
    draw_sprite_ext(spr_new_hoop_wobble, -1, x, y, argument1, 1, 0, c_white, 1)
    if argument0 != spr_new_hoop_baby{
    draw_sprite_ext(argument0, -1, x, y, argument1, 1, 0, c_white, 1) //draw post
    }
    //draw shadow
    if argument0 == spr_new_hoop_smedium{
    draw_sprite_ext(spr_new_hoop_wobble, -1, x-28, y+14, argument1, 1.1, 45,  c_white, .33)
    }
    if argument0 == spr_new_hoop_middle{
    draw_sprite_ext(spr_new_hoop_wobble, -1, x-33, y+17, argument1, 1.4, 45,  c_white, .33)
    }
    if argument0 == spr_new_hoop_baby{
    draw_sprite_ext(spr_new_hoop_wobble, -1, x-24, y+7, argument1, 1, 45,  c_white, .33)
    }
}

if sprite_index == spr_baby_hoop_repair{
    //draw_sprite_ext(spr_new_hoop_repair, -1, x, y, argument1, 1, 0, c_white, 1)
    if argument0 != spr_new_hoop_baby{
        //draw_sprite_ext(argument0, -1, x-15+(image_index/23*16), y-5+(image_index/23*8), argument1, 1, 90-(image_index/23)*(90), c_white, 1) //argument 1 flips, if -1, it flips horizontally
        draw_sprite_ext(argument2, -1, x, y, argument1, 1, 0, c_white, 1)
    }else{
        draw_sprite_ext(spr_new_hoop_repair, -1, x, y, argument1, 1, 0, c_white, 1)
    }
}

if sprite_index == spr_baby_hoop_fall{
    //draw_sprite_ext(spr_new_hoop_fall, -1, x, y, argument1, 1, 0, c_white, 1)
    if argument0 != spr_new_hoop_baby{
        //draw_sprite_ext(argument0, -1, x-(image_index/23*15), y+(image_index/23*5), argument1, 1, (image_index/23)*(90), c_white, 1) //argument 1 flips, if -1, it flips horizontally
        draw_sprite_ext(argument3, -1, x, y, argument1, 1, 0, c_white, 1)
    }else{
    draw_sprite_ext(spr_new_hoop_fall, -1, x, y, argument1, 1, 0, c_white, 1)
    }
}

if sprite_index == spr_baby_hoop_fallen{
    //draw_sprite_ext(spr_new_hoop_fallen, -1, x, y, argument1, 1, 0, c_white, 1)
    if argument0 != spr_new_hoop_baby{
        //draw_sprite_ext(argument0, -1, x-16, y+8, argument1, 1, 90, c_white, 1) //argument 1 flips, if -1, it flips horizontally
        draw_sprite_ext(argument4, -1, x, y, argument1, 1, 0, c_white, 1)
    }else{
    draw_sprite_ext(spr_new_hoop_fallen, -1, x, y, argument1, 1, 0, c_white, 1)
    }
}

if sprite_index == spr_baby_hoop{
    draw_sprite_ext(spr_new_hoop_baby, -1, x, y, argument1, 1, 0, c_white, 1)
    draw_sprite_ext(argument0, -1, x, y, argument1, 1, 0, c_white, 1)
    //draw shadow
    if(argument0 == spr_new_hoop_baby){
        draw_sprite_ext(spr_new_hoop_shadow, -1, x, y, 1, 1, 0,  c_white, .33)
    }
    if(argument0 == spr_new_hoop_smedium){
        draw_sprite_ext(spr_new_hoop_smedium_shadow, -1, x, y, 1, 1, 0,  c_white, .33)
    }
    if(argument0 == spr_new_hoop_middle){
        draw_sprite_ext(spr_new_hoop_middle_shadow, -1, x, y, 1, 1, 0,  c_white, .33)
    }
}

if global.debugmode{
    draw_sprite(spr_new_hoop_hitbox, -1, x, y);
}
