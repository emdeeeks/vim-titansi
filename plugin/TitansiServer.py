import json
import socket
import threading

class TitansiServer:
    def __init__(self):
        with open('config.json') as config_file:
            self.config = json.load(config_file)

        self.host = self.config["server"]["host"]
        self.port = self.config["server"]["port"]

        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.sock.bind((self.host, self.port))

    def listen(self):
        self.sock.listen(5)
        while True:
            #self.user = self.config["user"]
            client, address = self.sock.accept()
            client.settimeout(60)
            threading.Thread(target = self.listenToClient,args = (client,address)).start()

    def listenToClient(self, client, address):
        size = 1024
        while True:
            try:
                data = client.recv(size)
                if data:
                    response = data
                    client.send(response)
                else:
                    raise error('Client disconnected')
            except:
                client.close()
                return False

 
TitansiServer().listen()
