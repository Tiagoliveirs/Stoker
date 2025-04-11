import sys

from PyQt6.QtGui import QIcon
from PyQt6.QtWidgets import QLabel, QLineEdit, QCheckBox, QPushButton, QApplication
from PyQt6.uic.Compiler.qtproxies import QtCore, QtGui
from PySide6 import QtWidgets, QtCore, QtGui

class JanelaPrincipal(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle('StoKer')
        #self.setWindowIcon(QIcon('icone.png'))
        self.setGeometry(150, 150, 500, 500)

        self.Interface()

        self.show()

    def Interface(self):
        lblnome = QLabel('Usuário', self)
        lblnome.move(170, 170)

        self.c_user = QLineEdit(self)
        self.c_user.setPlaceholderText('Digite seu usuário')
        self.c_user.move(220, 170)

        lblsenha = QLabel('Senha', self)
        lblsenha.move(180, 200)

        self.c_senha = QLineEdit(self)
        self.c_senha.setPlaceholderText('Digite sua senha')
        self.c_senha.setEchoMode(QLineEdit.EchoMode.Password)
        self.c_senha.move(220, 200)

        self.salvar_credts = QCheckBox('Mantenha conectado', self)
        self.salvar_credts.clicked.connect(self.salvar_dados)
        self.salvar_credts.move(220,225)

        btn_entrar = QPushButton('Entrar', self)
        btn_entrar.clicked.connect(self.salvar_dados)
        btn_entrar.move(200,250)

        btn_cancelar = QPushButton('Cancelar', self)
        btn_cancelar.move(280, 250)
        btn_cancelar.clicked.connect(self.sair)

        self.show()

    def sair(self):
        sys.exit(qt.exec())

    def salvar_dados(self):
        base = []
        base.append(self.c_user.text())
        base.append(self.c_user.text())
        print(base)

qt = QApplication(sys.argv)
app = JanelaPrincipal()
sys.exit(qt.exec())