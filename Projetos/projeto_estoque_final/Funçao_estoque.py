import os

def imprimir_linhas():
    print("=" * 50)

class Estoque:
    def __init__(self):
        self.produtos = []
        self.relatorio = []

    def adicionar_produto(self, nome, preco, quantidade, vencimento):
        produto = {
            'nome': nome,
            'preco': preco,
            'quantidade': quantidade,
            'vencimento': vencimento
        }
        self.produtos.append(produto)
        self.relatorio.append(f"Entrada: {quantidade} unidades de '{nome}' adicionadas.")

    def remover_produto(self, nome):
        for produto in self.produtos:
            if produto['nome'] == nome:
                self.produtos.remove(produto)
                self.relatorio.append(f"Saída: Produto '{nome}' removido.")
                print(f"Produto '{nome}' removido com sucesso.")
                return
        print(f"Produto '{nome}' não encontrado.")

    def modificar_produto(self, nome, novo_preco=None, nova_quantidade=None, novo_vencimento=None):
        for produto in self.produtos:
            if produto['nome'] == nome:
                if novo_preco is not None:
                    produto['preco'] = novo_preco
                if nova_quantidade is not None:
                    produto['quantidade'] = nova_quantidade
                if novo_vencimento is not None:
                    produto['vencimento'] = novo_vencimento
                print(f"Produto '{nome}' modificado com sucesso.")
                return
        print(f"Produto '{nome}' não encontrado.")

    def gerar_relatorio(self):
        print("\nRelatório de Entrada e Saída:")
        for registro in self.relatorio:
            print(registro)

    def listar_produtos(self):
        return self.produtos
