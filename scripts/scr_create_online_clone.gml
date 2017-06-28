///scr_create_online_clone(array_index, self_id, st_height_, st_weight, st_power, st_speed, teamcolor, team_color, team_color_secondary)

with instance_create(x, y, obj_online_player){
    /*array_index = instance_number(obj_online_player)
    self_id = self.self_id
    st_height = self.st_height
    st_weight = self.st_weight
    st_power = self.st_power
    st_speed = self.st_speed
    teamcolor = self.teamcolor
    team_color = self.team_color
    team_color_secondary = self.team_color_secondary*/
    
    array_index = argument0
    self_id = argument1
    st_height = argument2
    st_weight = argument3
    st_power = argument4
    st_speed = argument5
    teamcolor = argument6
    team_color = argument7
    team_color_secondary = argument8
    st_position = argument9
    
    scr_load_smallheads(argument1)
    scr_genName()
}
