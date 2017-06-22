//FOR DUMMY
global.myX = x
global.myY = y

with obj_player_dummy{
if st_position == 3 and ch_ball == false{
    if(global.myX != x and global.myY != y){
            return true
            }else{
            //return false
            }
    }
}
