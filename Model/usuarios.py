from Control.database import Database

class Users:
    def __init__(self, username, password):
        self.username = username
        self.password = password

    def login(self):
        base = Database()
        params = {'where':f'username={self.username}'}
        result = base.busca('usuario', params)

        if result and result[1][1] == self.username:
            print(result[1][1])
        else:
            print('Usuário não encontrado')

        return base