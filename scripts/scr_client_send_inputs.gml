//if online, holds all player2 inputs
//obj_controller.online_client_movement_array[W, A, S, D, LMB, RMB, SPACE, CTRL, mouse_x, mouse_y)
if argument0 == 2{ //player 2
    //0 = not pressed
    //1 = pressed
    //2 = held
    //3 = released
    if(global.wasd){
        if(keyboard_check_direct(ord("W"))){
            if(obj_controller.online_client_movement_array[0] == 1){ //pressed
                obj_controller.online_client_movement_array[0] = 2 //held
            }else{
                obj_controller.online_client_movement_array[0] = 1 //pressed
            }
        }else{
            if(obj_controller.online_client_movement_array[0] == 2){ //held -> not held = released
                obj_controller.online_client_movement_array[0] = 3 //released
            }else{
                obj_controller.online_client_movement_array[0] = 0 //not pressed
            }
        }
        if(keyboard_check_direct(ord("A"))){
            if(obj_controller.online_client_movement_array[1] == 1){
                obj_controller.online_client_movement_array[1] = 2
            }else{
                obj_controller.online_client_movement_array[1] = 1            
            }
        }else{
            if(obj_controller.online_client_movement_array[1] == 2){
                obj_controller.online_client_movement_array[1] = 3
            }else{
                obj_controller.online_client_movement_array[1] = 0            
            }
        }
    }else{
        if(keyboard_check_direct(ord("Z"))){
            if(obj_controller.online_client_movement_array[0] == 1){
                obj_controller.online_client_movement_array[0] = 2
            }else{
                obj_controller.online_client_movement_array[0] = 1            
            }
        }else{
            if(obj_controller.online_client_movement_array[0] == 2){
                obj_controller.online_client_movement_array[0] = 3
            }else{
                obj_controller.online_client_movement_array[0] = 0            
            }
        }
        if(keyboard_check_direct(ord("Q"))){
            if(obj_controller.online_client_movement_array[1] == 1){
                obj_controller.online_client_movement_array[1] = 2
            }else{
                obj_controller.online_client_movement_array[1] = 1            
            }
        }else{
            if(obj_controller.online_client_movement_array[1] == 2){
                obj_controller.online_client_movement_array[1] = 3
            }else{
                obj_controller.online_client_movement_array[1] = 0            
            }
        } 
    }
    if(keyboard_check_direct(ord("S"))){
        if(obj_controller.online_client_movement_array[2] == 1){ //pressed
            obj_controller.online_client_movement_array[2] = 2 //held
        }else{
            obj_controller.online_client_movement_array[2] = 1 //pressed
        }
    }else{
        if(obj_controller.online_client_movement_array[2] == 2){ //held -> not held = released
            obj_controller.online_client_movement_array[2] = 3 //released
        }else{
            obj_controller.online_client_movement_array[2] = 0 //not pressed
        }
    }
    if(keyboard_check_direct(ord("D"))){
        if(obj_controller.online_client_movement_array[3] == 1){
            obj_controller.online_client_movement_array[3] = 2
        }else{
            obj_controller.online_client_movement_array[3] = 1            
        }
    }else{
        if(obj_controller.online_client_movement_array[3] == 2){
            obj_controller.online_client_movement_array[3] = 3
        }else{
            obj_controller.online_client_movement_array[3] = 0            
        }
    }
    if(mouse_check_button(mb_left)){
        if(obj_controller.online_client_movement_array[4] == 1){
            obj_controller.online_client_movement_array[4] = 2
        }else{
            obj_controller.online_client_movement_array[4] = 1            
        }
    }else{
        if(obj_controller.online_client_movement_array[4] == 2){
            obj_controller.online_client_movement_array[4] = 3
        }else{
            obj_controller.online_client_movement_array[4] = 0            
        }
    }
    if(mouse_check_button(mb_right)){
        if(obj_controller.online_client_movement_array[5] == 1){
            obj_controller.online_client_movement_array[5] = 2
        }else{
            obj_controller.online_client_movement_array[5] = 1            
        }
    }else{
        if(obj_controller.online_client_movement_array[5] == 2){
            obj_controller.online_client_movement_array[5] = 3
        }else{
            obj_controller.online_client_movement_array[5] = 0            
        }
    }
    if(keyboard_check(vk_space)){
        if(obj_controller.online_client_movement_array[6] == 1){
            obj_controller.online_client_movement_array[6] = 2
        }else{
            obj_controller.online_client_movement_array[6] = 1            
        }
    }else{
        if(obj_controller.online_client_movement_array[6] == 2){
            obj_controller.online_client_movement_array[6] = 3
        }else{
            obj_controller.online_client_movement_array[6] = 0            
        }
    }
    if(keyboard_check(vk_control)){
        if(obj_controller.online_client_movement_array[7] == 1){
            obj_controller.online_client_movement_array[7] = 2
        }else{
            obj_controller.online_client_movement_array[7] = 1            
        }
    }else{
        if(obj_controller.online_client_movement_array[7] == 2){
            obj_controller.online_client_movement_array[7] = 3
        }else{
            obj_controller.online_client_movement_array[7] = 0            
        }
    }
    if(keyboard_check(vk_alt)){
        if(obj_controller.online_client_movement_array[8] == 1){
            obj_controller.online_client_movement_array[8] = 2
        }else{
            obj_controller.online_client_movement_array[8] = 1            
        }
    }else{
        if(obj_controller.online_client_movement_array[8] == 2){
            obj_controller.online_client_movement_array[8] = 3
        }else{
            obj_controller.online_client_movement_array[8] = 0            
        }
    }
    obj_controller.online_client_movement_array[9] = mouse_x 
    obj_controller.online_client_movement_array[10] = mouse_y
}
