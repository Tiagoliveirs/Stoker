import mysql.connector
from mysql.connector import Error

class Database:
    def __init__(self, host, dbname, username, passe):
        try:
            self.con = mysql.connector.connect(
                host=host,
                database=dbname,
                user=username,
                password=passe
            )
            if self.con.is_connected():
                print("Conexão com o banco de dados bem-sucedida")
        except Error as e:
            print(f"Erro ao conectar ao MySQL: {e}")
            self.con = None

    def query(self, busca):
        try:
            cursor = self.con.cursor(dictionary=True)
            cursor.execute(busca)
            results = cursor.fetchone()
            cursor.close()
            return results
        except Error as e:
            print(f"Erro ao executar a consulta: {e}")
            return None

    def fetch_all(self, query):
        try:
            cursor = self.con.cursor(dictionary=True)
            cursor.execute(query)
            result = cursor.fetchall()
            cursor.close()
            return result
        except Error as e:
            print(f"Erro ao buscar dados: {e}")
            return None

    def close(self):
        if self.con and self.con.is_connected():
            self.con.close()
            print("Conexão com banco de dados fechada")