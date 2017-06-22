team1distance = -1;
team2distance = -1;

if instance_exists(obj_quaffle){
    team1distance = (abs(obj_quaffle.x - scr_chaser_teammate_closest_quaffle("x")) + abs(obj_quaffle.y - scr_chaser_teammate_closest_quaffle("y")) )
    team2distance = (abs(obj_quaffle.x - scr_chaser_dummy_closest_quaffle("x")) + abs(obj_quaffle.y - scr_chaser_dummy_closest_quaffle("y")) )
}else{
    exit
}

if team1distance == -1{
    show_error("ERROR, -1", false);
}

if team1distance < team2distance{
    //show_message("Team 1 is closest" + string(team1distance) + " vs " + string(team2distance))
    return true;
}else{
    //show_message("Team 2 is closest" + string(team1distance) + " vs " + string(team2distance))
    return false;
}
