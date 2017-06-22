/*

obj_controller: holds most things, including players and their attributes, includes wins/losses and game options, generates players at the beginning of several rooms, sets game schedule arrays w/ scr_set_schedule

obj_ref_controller: holds most things related to the game, including score, sprites and logos for teams

obj_todays_game: holds opposing team attributes; doesn't hold their offensive and defensive positions; creates opposing team for postpitch
    -sets default po_radius to 80

obj_nextbutton: holds default values for starting positions for players and offensive/defensive positions

-offensive and defensive position are randomized in the create event for obj_player_dummy

scr_set_schedule: sets bracket and pool play arrays

DEFAULTS:
-Zone size: obj_player_position
-Most things: obj_controller.charray
    -set in obj_controller->room start event
    -set in obj_nextbutton->left click->if in rm_league_options
    -set in obj_nextbutton-> various rooms in creating strategy set defaults
    -set in scr_set_charray, which is set in league options and in strategy
    -obj_bench_slot, which comes from obj_bench_gen
    
Team names/colors: scr_random_name

SAVED GAMES: in directory
-sv_menu (checked in obj_leagueplay) ---> in interface folder
-savegame (checked in rm_signin for obj_signin) ---> in interface folder

IF YOU CLICK ON IT: in interface folder

WEATHER: in settings of pitch
-LEFT PRESSED in obj_todaysgame

Player AI:
-scr_teammate_step
-scr_dummy_step

//obj_controller.charray[i, 0] = self_id
//obj_controller.charray[i, 1] = tetherX1 <--- po_dx, defensive X position
//obj_controller.charray[i, 2] = tetherY1 <--- po_dy, defensive Y position
//obj_controller.charray[i, 3] = tetherX2 <--- legacy, not used
//obj_controller.charray[i, 4] = tetherY2 <--- legacy, not used
//obj_controller.charray[i, 5] = strategy <--- zone, point, or man to man
//obj_controller.charray[i, 6] = manStrategy <--- legacy
//obj_controller.charray[i, 7] = zone <--- if past a certain x or y value, attack
//obj_controller.charray[i, 8] = zonesize <--- if past a certain radius, attack
//obj_controller.charray[i, 9] = seeker_catch
//obj_controller.charray[i, 10] = seeker_defend
//obj_controller.charray[i, 11] = st_position
//obj_controller.charray[i, 12] = x/y starting location (for brooms up phase)
//obj_controller.charray[i, 13] = po_ox
//obj_controller.charray[i, 14] = po_oy
//obj_controller.charray[i, 15] = go_broomsup
//obj_controller.charray[i, 16] = ??? <--- not used I think
//obj_controller.charray[i, 17] = po_withball <--- how far beaters will go when they have a bludger
//obj_controller.charray[i, 18] = po_noball <--- how far beaters go when they don't have a bludger

*/
