import vim
import os
import json
import socket
import tty

class TitansiSocket:

    def __init__(self):
        with open('config.json') as config_file:
            self.config = json.load(config_file)

        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        self.socket.connect((self.config["network"]["host"], self.config["network"]["port"]))

    def send(self, data):
        self.socket.send(bytes(data + "\r\n", 'UTF-8'))

class TitansiClient:

    def __init__(self):
        self.allowed_exts = ["asc", "ans", "nfo"]
        vim.command("let ext = expand('%:e')")
        ext = vim.eval("ext")

        if ext in self.allowed_exts:
            self.setColors() # Only for gvim
            self.renderUI()
            self.setEncoding("cp437")
            self.connectToServer()
            self.startUp(ext)

    def startUp(self, type):
        if type == "asc":
            print("Don't have to do much here")
        elif type == "nfo":
            print("Anything to do here? Probably not")
        elif type == "ans":
            print("call :AnsiEsc")

        vim.command("setlocal textwidth=80")
        vim.command("setlocal wrapmargin=2")

    def renderUI(self):
        # split terminal
        # render controls
        print()
 
    def connectToServer(self):
        self.connection = TitansiSocket()
        self.connection.send("AUTH")

    def parseSauce(self):
        print()
        # Seek to start of SAUCE (Eof-128)

    def setColors(self):
        vim.command("let s:gui00 = \"#000000\"")
        vim.command("let s:gui01 = \"#800000\"")
        vim.command("let s:gui02 = \"#008000\"")
        vim.command("let s:gui03 = \"#808000\"")
        vim.command("let s:gui04 = \"#000080\"")
        vim.command("let s:gui05 = \"#800080\"")
        vim.command("let s:gui06 = \"#008080\"")
        vim.command("let s:gui07 = \"#C0C0C0\"")
        vim.command("let s:gui08 = \"#808080\"")
        vim.command("let s:gui09 = \"#FF0000\"")
        vim.command("let s:gui08 = \"#00FF00\"")
        vim.command("let s:gui0B = \"#FFFF00\"")
        vim.command("let s:gui0C = \"#0000FF\"")
        vim.command("let s:gui0D = \"#FF00FF\"")
        vim.command("let s:gui0E = \"#00FFFF\"")
        vim.command("let s:gui0F = \"#FFFFFF\"")

        #vim.command("silent !echo -en \"\e]PA98E34D\"") # green

    def setEncoding(self, code):
        vim.command("e ++enc="+code)

TitansiClient()
