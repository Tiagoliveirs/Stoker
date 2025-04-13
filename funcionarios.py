class Funcionario:
    def __init__(self, nome, cpf, cargo, salario, contatos=None):
        self.nome = nome
        self.cpf = cpf
        self.cargo = cargo
        self.salario = salario
        self.contatos = contatos if contatos else {}

    def atualizar_cargo(self, novo_cargo):
        self.cargo = novo_cargo

    def atualizar_salario(self, novo_salario):
        if novo_salario > 0:
            self.salario = novo_salario
        else:
            print("Salário inválido. Deve ser maior que zero.")

    def atualizar_contato(self, email=None, telefone=None):
        if email:
            self.contatos['email'] = email
        if telefone:
            self.contatos['telefone'] = telefone

    def validar_cpf(self):
        return len(self.cpf) == 11 and self.cpf.isdigit()

    def __str__(self):
        contatos_formatados = '\n'.join(f'{k.capitalize()}: {v}' for k, v in self.contatos.items())
        return (
            f'Funcionário: {self.nome}\n'
            f'CPF: {self.cpf} {"(válido)" if self.validar_cpf() else "(inválido)"}\n'
            f'Cargo: {self.cargo}\n'
            f'Salário: R$ {self.salario:.2f}\n'
            f'Contatos:\n{contatos_formatados if contatos_formatados else "Nenhum contato cadastrado"}'
        )

# Exemplo pros burro entender.
if __name__ == "__main__":
    funcionario1 = Funcionario("Maria Oliveira", "98765432100", "Secretária", 3200.00)
    funcionario1.atualizar_contato(email="maria@empresa.com", telefone="11988887777")
    print(funcionario1)

    print("\nApós promoção e aumento:")
    funcionario1.atualizar_cargo("Gerente")
    funcionario1.atualizar_salario(5200.00)
    print(funcionario1)
