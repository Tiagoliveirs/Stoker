import mysql.connector
from mysql.connector import Error

class Connection:
    def __init__(self):
        try:
            self.con = mysql.connector.connect(
                host='localhost',
                database='stoker',
                user='root',
                password=''
            )
        except Error as e:
            print(f"Erro ao conectar ao MySQL: {e}")
            self.con = None