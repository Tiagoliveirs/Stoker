from Control.database import Database

class Usuario:
    def __init__(self, username, password):
        self.username = username
        self.password = password

    def login(self):
        base = Database()