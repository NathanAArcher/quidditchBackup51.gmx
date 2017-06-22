///scr_flip_coordinate_y(room_height, y coordinate)

//argument0 = room_height
//argument1 = y coordinate

distance_from_center = (argument1-(argument0/2))

if(global.threedmode){
    return argument1
}else{
    return (argument0/2 - distance_from_center)
}

//return (argument0-argument1)-argument0/4

/*
if(argument1 > argument0){
    return (argument0/2)-(argument1-argument0)
}*/
