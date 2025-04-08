import mysql.connector
from mysql.connector import Error
import _mysql_connector

class Database:
    def __init__(self):
        try:
            self.connect = mysql.connector.connect(
                host='localhost',
                user='root',
                password='',
                database='stoker'
            )
        except Error as e:
            print(f"Erro ao conectar ao MySQL: {e}")
            self.connect = None

    def busca(self, tabela, params=None):
        try:
            sql = f"SELECT * FROM {tabela}"
            cursor = self.connect.cursor()
            if params:
                if isinstance(params, dict):
                    params = tuple(params.values())
                cursor.execute(sql, params)
            else:
                cursor.execute(sql)
            results = cursor.fetchall()
            cursor.close()
            return results
        except Error as e:
            print(f"Erro ao executar a consulta: {e}")
            return None

    def close(self):
        if self.connect and self.connect.is_connected():
            self.connect.close()
            print("Conexão com banco de dados fechada")