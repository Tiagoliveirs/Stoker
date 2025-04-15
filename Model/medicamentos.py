from Control.database import Database

class Medicamentos:
    def __init__(self, nome, princAtv, desc, unmed, dosagem, fabricante, forma=None, categoria=None, status=None, tipo=None):
        self.nome = nome
        self.princAtv = princAtv
        self.desc = desc
        self.dosagem = dosagem
        self. fabricante = fabricante
        self.unmed = unmed
        if categoria:
            #categorias{Fitoterápico, Alopático, Homeopático, Similar, Genérico, Referência, Manipulado}
            self.categoria = categoria
        else:
            self.categoria = "Genérico"

        if forma:
            self.forma = forma
        else:
            self.forma = "Comprimido"

        if tipo:
            self.tipo = tipo
        else:
            self.tipo = "Antibióticos"

        if status:
            self.status = status
        else:
            self.status = "Ativo"