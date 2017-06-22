//argument0 = dummy x bludgerless beater looking for beater
//argument1 = dummy y bludgerless beater looking for beater
//argument2 == "x" ---> return x
//argument2 == "y" ---> return y

with obj_player_dummy{
    if st_position == 3 and ch_off_broom == false{
        if argument2 == "x" and (argument0 = x){
            return x
        }
        if argument2 == "y" and (argument1 = y){
            return y
        }
    }
}
