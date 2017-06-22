skincolor[0] = c_white//make_color_hsv(16, 240, 222) //pale caucasian
skincolor[1] = c_white //deeper caucasian
skincolor[2] = make_color_hsv(23, 190, 250)//(21, 166, 139) // tan
skincolor[3] = make_color_hsv(21, 190, 220)//(21, 166, 139) //dark tan
skincolor[4] = make_color_hsv(13, 190, 160)//make_color_hsv(13, 240, 70) //african light
skincolor[5] = make_color_hsv(13, 190, 130) //african dark
//skincolor[6] = c_yellow //make_color_hsv(23, 240, 193) //asian
skincolor[6] = make_color_rgb(255, 201, 128)
skincolor[7] = make_color_rgb(187, 143, 109) //mikey jay
//skincolor[7] = make_color_rgb(17, 87, 139) //mikey jay
//skincolor[8] = make_color_hsv(23, 133, 162) //haroun
skincolor[8] = make_color_rgb(218, 179, 126) //haroun 

if self_id == 1 or self_id == 8 or self_id == 73{ //dark brown; african
return skincolor[5]
}
if self_id == 28 or /*self_id == 57 or*/ self_id == 58{ //tan; haroun
return skincolor[8]
}
if self_id == 0 or self_id == 57{ //tan; Luis
return skincolor[3]
}
if self_id == 37 or self_id == 49{ //brown
return skincolor[4]
}
if self_id == 29{ //previously skincolor[4]; mikey jay
return skincolor[7]
}
if self_id == 54{
return skincolor[6]
}

return make_color_rgb(255, 177, 163)
return skincolor[argument0]
