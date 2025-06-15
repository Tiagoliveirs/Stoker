class medicamentos:
    def __init__(self, nome, preco, quantidade, lotes):
        self.nome = nome
        self.preco = preco
        self.quantidade = quantidade
        self.lotes = lotes
    
    def adicionar_lote(self, numero_lote, validade, quantidade):
        self.lotes.append({'lote':numero_lote, 'validade':validade, 'quantidade':quantidade})
