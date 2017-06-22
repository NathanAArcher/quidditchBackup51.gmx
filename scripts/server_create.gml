#define server_create
///server_create(port)

var 
port = argument0,
server = 0;

server = network_create_server_raw(network_socket_tcp, port, 20); //we need to use raw otherwise the functions are different.
clientmap = ds_map_create();
client_id_counter = 0;
//raw allows us to create a server on C# or C++; makes it a lot faster

send_buffer = buffer_create(256, buffer_fixed, 1);

//if value < 0, connection fails

if(server < 0) show_error("Could not Create Server!", true);

if(server >= 0){
    scr_show_notification("Server initialized: " + string(server) + ", Port: " + string(port) + ", IP: " + "?")
}

return server;


#define server_handle_connect
///server_handle_message(socket_id, buffer)

var
socket_id = argument0;

l = instance_create(0, 0, obj_serverClient);
l.socket_id = socket_id;
l.client_id = client_id_counter++; //can only hold 65,000 connections

if(client_id_counter >= 65000){
    client_id_counter = 0;
}

clientmap[? string(socket_id)] = l;



#define server_handle_message
///server_handle_message(socket_id, buffer);


var socket_id = argument0;
var buffer = argument1;
var client_id_current = clientmap[? string(socket_id)].client_id;
//var client_id_current = 1;

//only called when data sent through a server
//should be unique for each game
//put different types of methods into different case methods

//case 0 will be movement
//case 1 will be shooting
//etc.

while(true){
    var
    message_id = buffer_read(buffer, buffer_u8); //using buffer u8 for unsigned 8 bit integer
    
    switch(message_id)
    {
        case MESSAGE_MOVE:
            var
            xx = buffer_read(buffer, buffer_u16); //might need to be comma?
            yy = buffer_read(buffer, buffer_u16);
            
            buffer_seek(send_buffer, buffer_seek_start, 0); //start back from the beginning of the 256 bytes
            buffer_write(send_buffer, buffer_u8, MESSAGE_MOVE); //1 byte
            buffer_write(send_buffer, buffer_u16, client_id_current); //2 bytes
            buffer_write(send_buffer, buffer_u16, xx); //2 bytes
            buffer_write(send_buffer, buffer_u16, yy); //2 bytes
            
            with(obj_serverClient){
                if(client_id != client_id_current){ //so I don't send to myself ;)
                    //network_send_raw(self.socket_id, send_buffer, 7); //7 bytes total; 7 = size
                    //was ^ in tutorial at Part 1, 35:01
                    network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer)); //7 bytes total; 7 = size
                    //changed from 7 to buffer_tell(send_buffer) in part 2 at 15:00
                }
            }
            
        break;
    }
    
    //failsafe
    if(buffer_tell(buffer) == buffer_get_size(buffer)){ //if > 256 bytes; overflow
        //gets size of given buffer
        break;
    }
}


#define server_handle_disconnect
///server_handle_message(socket_id);

var
socket_id = argument0;

with(clientmap[? (string(socket_id))]) {
    instance_destroy();
}

ds_map_delete(clientmap, string(socket_id));