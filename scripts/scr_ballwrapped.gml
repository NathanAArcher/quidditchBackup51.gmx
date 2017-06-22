with(obj_player_dummy){
    if st_position == 1 or st_position == 2{
        if ch_ball = true{
            return drag //if drag is != 0, then the player is wrapped
        }
    }
}

with(obj_player_teammate){
    if st_position == 1 or st_position == 2{
        if ch_ball = true{
            return drag //if drag is != 0, then the player is wrapped
        }
    }
}
