from Control.database import Database
from datetime import datetime

class Users:
    def __init__(self, username, password):
        self.username = username
        self.password = password

    def login(self):
        con = Database()
        busca = f"SELECT * FROM usuario WHERE username = '{self.username}';"
        result = con.query(busca)
        if result and result['senha'] == self.password:
            print(f"Bem-vindo {result['username']}")
        else:
            print('Usuário não encontrado')