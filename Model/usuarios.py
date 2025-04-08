from Control.database import Database

class Users:
    def __init__(self, username, password):
        self.username = username
        self.password = password

    def login(self):
        base = Database()
        base.busca('usuario')
        return base