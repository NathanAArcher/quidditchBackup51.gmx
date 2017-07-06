/*view_xview[0..7] X position of the view in the room.
view_yview[0..7] Y position of the view in the room.
view_wview[0..7] Width of the view in the room.
view_hview[0..7] Height of the view in the room.
view_xport[0..7] X-position of the viewport in the drawing region.
view_yport[0..7] Y-position of the viewport in the drawing region.
view_wport[0..7] Width of the viewport in the drawing region.
view_hport[0..7] Height of the viewport in the drawing region.
*/

oob_drawX = x
oob_drawY = y

//draw player based on view

if(x > view_xview[0]+view_wview[0]+8){
    oob_drawX = view_xview[0]+view_wview[0]-24
}else if(x < view_xview[0]-4){
    oob_drawX = view_xview[0]+24
}

if(y > view_yview[0]+view_hview[0]+8-80){ //hud height = 80
    oob_drawY = view_yview[0]+view_hview[0]-24-80
}else if(y < view_yview[0]-4){
    oob_drawY = view_yview[0]+24
}

//if within view, don't draw

if(oob_drawX == x and oob_drawY == y){
    exit
}

draw_set_color(c_white)
draw_circle(oob_drawX, oob_drawY, 16, false)
if(argument0 == 1){
    draw_set_color(c_red)
    team_color = c_red //not team color just color of the circle lol
}else{
    draw_set_color(c_dkgray)
    team_color = c_dkgray
}
draw_circle(oob_drawX, oob_drawY, 16, true)
draw_circle(oob_drawX-1, oob_drawY-1, 16, true)
draw_circle(oob_drawX, oob_drawY-1, 16, true)
draw_circle(oob_drawX-1, oob_drawY, 16, true)
draw_circle(oob_drawX+1, oob_drawY, 16, true)
draw_circle(oob_drawX, oob_drawY+1, 16, true)
draw_circle(oob_drawX+1, oob_drawY-1, 16, true)
draw_circle(oob_drawX-1, oob_drawY+1, 16, true)
draw_circle(oob_drawX+1, oob_drawY+1, 16, true)

//draw thick circle

if(instance_exists(obj_follow_object)){
    draw_sprite_ext(spr_player_out_bounds_arrow, -1, oob_drawX, oob_drawY, 1, 1, point_direction(obj_follow_object.x, obj_follow_object.y, oob_drawX, oob_drawY), team_color, 1)
}

if argument0 == 1{
    draw_sprite(spr_ball, 5, oob_drawX, oob_drawY)
    if global.debugmode{
        draw_text(oob_drawX, oob_drawY-16, string(x) + ", " + string(y))
        draw_set_font(fnt_name)
        draw_set_valign(fa_top)
        draw_set_halign(fa_center)
        draw_text(oob_drawX, oob_drawY+16, thoughts)
        draw_text(oob_drawX, oob_drawY, global.possession)
    }
}else{
    draw_sprite(spr_bludger, 0, oob_drawX, oob_drawY)
}
