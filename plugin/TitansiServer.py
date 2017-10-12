import sys
import os
import json
import socket
from pprint import pprint

class TitansiServer:
    def __init__(self):

        with open('config.json') as data_file:
            data = json.load(data_file)

        s = socket.socket()
        s.bind((data["server"]["host"], data["server"]["port"]))

        while True:
            s.listen(1)
            conn, addr = s.accept()
            print ("Connection from: " + str(addr))
            data = conn.recv(1024).decode()
            if not data:
                break
            print ("from connected  user: " + str(data))
        conn.close()

TitansiServer()
