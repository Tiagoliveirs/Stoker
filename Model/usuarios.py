from Control.database import Database

class Users:
    def __init__(self, username, password):
        self.username = username
        self.password = password

    def login(self):
        base = Database()
        result = base.busca('usuario')
        if result and result[1][1] == self.username:
            print(result[1][1])
        else:
            print('Usuário não encontrado')

        return base