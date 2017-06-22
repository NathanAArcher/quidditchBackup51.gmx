with obj_player_dummy{
    if st_position == 2{
        if ch_ball == true{
            return true;
        }
    }
}

with obj_player_teammate{
    if st_position == 2{
        if ch_ball == true{
            return true;
        }
    }
}

//return false;
