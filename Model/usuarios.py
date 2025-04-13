from Control.database import Database
from datetime import datetime

class Users:
    def __init__(self, username, password):
        self.username = username
        self.password = password
        self.data = datetime

    def login(self):
        con = Database()
        busca = f"SELECT * FROM usuario WHERE username = '{self.username}';"
        result = con.query(busca)
        if result and result['senha'] == self.password:
            print(f"Bem-vindo {result['username']}")
        else:
            print('Usuário não encontrado')

    def mudarSenha(self, username, senhaatual, novasenha):
        con = Database()
        busca = f"SELECT * FROM usuario WHERE username = '{username}';"
        result = con.query(busca)
        if result and result['senha'] == senhaatual and senhaatual != novasenha:
            up = f"UPDATE usuario SET senha = '{novasenha}' WHERE id = '{result['idUsuario']}';"
            con.query(up)
            print(f"Senha alterada com sucesso")
        else:
            print('Não foi possível alterar sua senha')