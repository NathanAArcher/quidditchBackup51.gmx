//FOR TEAMMATE
if instance_exists(obj_bludger){
    if instance_nearest(obj_bludger.x, obj_bludger.y, obj_player_teammate).x == x and instance_nearest(obj_bludger.x, obj_bludger.y, obj_player_teammate).y == y and st_position == 3 and self.ch_off_broom == false and ch_ball == false
    {
        return true
    }
}
