//check if any players have the quaffle
//will return false if no players have quaffle

with(obj_player_dummy){
    if(st_position < 3){
        if (ch_ball == true){
            return true
        }    
    }
}

with(obj_player_teammate){
    if(st_position < 3){
        if(ch_ball == true){
            return true
        }
    }
}
