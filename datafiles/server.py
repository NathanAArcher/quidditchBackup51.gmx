import suspengine
app = suspengine


@app.channel("auth")
def auth(c,addr,mess):
    print(mess)
    print("connected")



app.server("127.0.0.1",5000)
