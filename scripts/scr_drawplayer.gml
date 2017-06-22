//Draws the HUD over the player for player1 and player2
//Refer to scr_drawchar for the individual player animations!

if mouse_check_button(mb_left) and ch_ball == true
{
draw_sprite(spr_power, ((ch_power-.5)*18), x, y)
}

draw_sprite_ext(spr_player_waypoint, -1, x-16, y-64, 1, 1, 0, global.team1_color, 1)
