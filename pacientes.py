class Paciente:
    def __init__(self, nome, cpf, endereco, contatos=None):
        self.nome = nome
        self.cpf = cpf
        self.endereco = endereco
        self.contatos = contatos if contatos else {}  # Garante que seja um dicionário

    def contato_paciente(self, email=None, telefone=None):
        if email:
            self.contatos['email'] = email
        if telefone:
            self.contatos['telefone'] = telefone

    def atualizar_endereco(self, novo_endereco):
        self.endereco = novo_endereco

    def validar_cpf(self):
        return len(self.cpf) == 11 and self.cpf.isdigit()

    def __str__(self):
        contatos_formatados = '\n'.join(f'{k.capitalize()}: {v}' for k, v in self.contatos.items())
        return (
            f'Paciente: {self.nome}\n'
            f'CPF: {self.cpf} {"(válido)" if self.validar_cpf() else "(inválido)"}\n'
            f'Endereço: {self.endereco}\n'
            f'Contatos:\n{contatos_formatados if contatos_formatados else "Nenhum contato cadastrado"}'
        )

# Exemplo Pq ninguem entende sem exemplo
paciente1 = Paciente("João da Silva", "12345678901", "Rua A, 123")
paciente1.contato_paciente(email="joao@gmail.com", telefone="11999999999")
print(paciente1)

# Atualizando endereço
paciente1.atualizar_endereco("Rua Nova, 456")
print("\nApós atualizar o endereço:")
print(paciente1)
