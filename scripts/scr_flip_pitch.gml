//changes AI from right side to left side, or from top to bottom

if(argument0 == 5){ //for bludger and quaffle
    if(global.threedmode){
        y = y
        if(x < room_width/2){
            x = (room_width/2 + (room_width/2 - x))
        }else{
            x = (room_width/2 - (x - room_width/2))
        }    
    exit
    }
}

/*if(argument0 == 1 or argument0 == 3){
    team_color = global.team2_color
    teamcolor = global.team2_color
    team_color_secondary = global.team2_color_secondary
    
    if(global.team2_color == global.team1_color){
        team_color = global.team2_color_secondary
        teamcolor = global.team2_color_secondary
        team_color_secondary = global.team2_color
    }
}else{
    team_color = global.team1_color
    teamcolor = global.team1_color
    team_color_secondary = global.team1_color_secondary
    
    if(global.team2_color == global.team1_color){
        team_color = global.team2_color_secondary
        teamcolor = global.team2_color_secondary
        team_color_secondary = global.team2_color
    }    
}*/

if(direction > 180){
    direction = direction - 180
}else{
    direction = direction + 180
}

if(truedirection > 180){
    truedirection = truedirection - 180
}else{
    truedirection = truedirection + 180
}


if(draw_direction > 180){
    draw_direction = draw_direction - 180
}else{
    draw_direction = draw_direction + 180
}


if(global.threedmode){
    if(argument0 == 1){
        instance_change(obj_player_dummy, false)
        team = 2
    }
    if(argument0 == 2){
        instance_change(obj_player_teammate, false)
        team = 1
    }
    if(argument0 == 3){
        instance_change(obj_player2_test, false)
        team = 2
    }
    if(argument0 == 4){
        instance_change(obj_player_test, false)
        team = 1
    }
    
    y = y
    if(x < room_width/2){
        x = (room_width/2 + (room_width/2 - x))
    }else{
        x = (room_width/2 - (x - room_width/2))
    }
    
    if(po_dx < room_width/2){
        po_dx = (room_width/2 + (room_width/2 - po_dx))
    }else{
        po_dx = (room_width/2 + (room_width/2 - po_dx))
    }
    
    if(po_ox < room_width/2){
        po_ox = (room_width/2 + (room_width/2 - po_ox))
    }else{
        po_ox = (room_width/2 + (room_width/2 - po_ox))
    }
    
    if(po_chaser_zone < room_width/2){
        po_chaser_zone = (room_width/2 + (room_width/2 - po_chaser_zone))
    }else{
        po_chaser_zone = (room_width/2 + (room_width/2 - po_chaser_zone))
    }
}


