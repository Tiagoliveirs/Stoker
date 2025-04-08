import mysql.connector
from mysql.connector import Error
import _mysql_connector

class Database:
    def __init__(self):
        try:
            self.connect = mysql.connector.connect(
                host='localhost',
                user='root',
                password='Tios_1012',
                database='stoker'
            )
        except Error as e:
            print(f"Erro ao conectar ao MySQL: {e}")
            self.connect = None