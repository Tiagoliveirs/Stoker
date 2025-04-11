import mysql.connector
from mysql.connector import Error
from datetime import datetime

class Database:
    def __init__(self):
        try:
            self.con = mysql.connector.connect(
                host='localhost',
                database='stoker',
                user='root',
                password=''
            )
            if self.con.is_connected():
                print("Conexão com o banco de dados bem-sucedida")
        except Error as e:
            print(f"Erro ao conectar ao MySQL: {e}")
            self.con = None

    def busca(self, tabela, params=None):
        try:
            sql = f"SELECT * FROM {tabela}"
            cursor = self.con.cursor()
            if params:
                if isinstance(params, dict):
                    params = tuple(params.values())
                    print(params)
                cursor.execute(sql, params)
            else:
                cursor.execute(sql)
            results = cursor.fetchall()
            cursor.close()
            print(sql)
            return results
        except Error as e:
            print(f"Erro ao executar a consulta: {e}")
            return None

    def close(self):
        if self.con and self.con.is_connected():
            self.con.close()
            print("Conexão com banco de dados fechada")