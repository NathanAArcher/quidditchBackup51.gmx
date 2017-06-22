//FOR TEAMMATE
global.myX = x
global.myY = y

with obj_player_teammate{
if st_position == 3 and ch_ball == false{
    if(x != global.myX and y != global.myX){
            return true
            }else{
            //return false
            }
        }
}
