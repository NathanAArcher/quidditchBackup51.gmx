import suspengine
import uuid


app = suspengine

room = {}

#for i in range(100):
#    temp = str(uuid.uuid4())
#    print(temp)
#    print(temp[0:8])


@app.channel("disconnect")
def disconnect(c,addr):
    global room
    print(room.keys())
    delete = None
    for key in room.keys():
        if room[key]['owner'] == c:
            #Later we will send a message to everyone connected
            delete = key
            print('Deleted Room '+key)
    if delete != None:
        del room[delete]
        print(room)


@app.channel("auth")
def auth(c,addr,mess):
    global room
    if mess['msgid'] == 0:
        app.savevariable("id",mess['id'],c)
        print(mess['id'])
    elif mess['msgid'] == 2:
        temp = str(uuid.uuid4())[0:8]
        while temp in room:
            temp = str(uuid.uuid4())[0:8]
        room[temp] = {}
        room[temp]['owner'] = c
        room[temp]['objects'] = []
        room[temp]['players'] = []
        print('Room Created - '+temp)
        packet = {}
        packet['msgid'] = 2
        packet['roomid'] = temp
        packet['isowner'] = 1
        app.emit("auth",packet,c)



app.server("127.0.0.1",5000)
