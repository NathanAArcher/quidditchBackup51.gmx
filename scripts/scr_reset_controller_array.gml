for(w = 0; w < 15; w += 1) {
    for( h = 0; h < 19; h += 1 ) {
        charray[w , h] = -1;
    }
}

for(w = 0; w < 15; w += 1) {
    for( h = 0; h < 19; h += 1 ) {
        client_charray[w , h] = -1;
    }
}

global.team1_color = c_red
global.team2_color = c_blue
global.team1_color_secondary = c_white

for(a = 0; a < 7; a += 1){ //SHOULD HOLD PLAYERS AS THEY ARE CREATED!
    global.team1_array[a] = 0
    global.team2_array[a] = 0
}
