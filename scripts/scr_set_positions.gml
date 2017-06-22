//sets starting players into their positions if designated as starters in strategy

findID = 0

for(i = 0; i < 14; i += 1){
    if obj_controller.charray[i, 0] == self_id
    {
    findID = i
    }

if distance_to_object(obj_bench_slot) > 1 and added == false{
    obj_controller.charray[i, 0] = self_id
    obj_controller.charray[i, 1] = tetherX1
    obj_controller.charray[i, 2] = tetherY1
    obj_controller.charray[i, 3] = tetherX2
    obj_controller.charray[i, 4] = tetherY2
    obj_controller.charray[i, 5] = strategy
    obj_controller.charray[i, 6] = manStrategy
    obj_controller.charray[i, 7] = zone
    obj_controller.charray[i, 8] = zonesize
    obj_controller.charray[i, 9] = seeker_catch
    obj_controller.charray[i, 10] = seeker_defend
    obj_controller.charray[i, 11] = st_position
    
    //obj_controller.charray[findID, 12] = x broomsupX
    
    added = true
    
}
}
