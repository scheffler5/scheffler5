import os
from Funçoes_estoque import Estoque

estoque = Estoque()

def imprimir_linhas():
    print("=" * 50)

def limpar_console():
    if os.name == 'nt':
        os.system('cls')
    else:
        os.system('clear')

def menu_visualizacao():
    while True:
        imprimir_linhas()
        print("Você pode escolher o tipo de visualização: ")
        print("1 - Visualizar todos os itens presentes no estoque")
        print("2 - Visualizar um item em específico")
        print("3 - Sair do módulo de visualização")
        
        try:
            acao = int(input("Digite a ação para execução: "))
            if acao == 1:
                imprimir_linhas()
                print('Aqui estão os itens em estoque:')
                produtos = estoque.listar_produtos()
                if produtos:  # Verifica se há produtos no estoque
                    for produto in produtos:
                        print(f"Produto: {produto['nome']}, Preço: R${produto['preco']:.2f}, "
                              f"Quantidade: {produto['quantidade']}, Vencimento: {produto['vencimento']}")
                else:
                    print("Nenhum produto cadastrado no estoque.")
            elif acao == 2:
                while True:
                    imprimir_linhas()
                    prod = input("Digite exatamente o nome do produto que você quer encontrar: ")
                    encontrado = False
                    for produto in estoque.listar_produtos():
                        if produto['nome'].lower() == prod.lower():
                            print(f"Produto: {produto['nome']}, Preço: R${produto['preco']:.2f}, "
                                  f"Quantidade: {produto['quantidade']}, Vencimento: {produto['vencimento']}")
                            encontrado = True
                            break
                    if not encontrado:
                        print("Produto não encontrado.")
                    
                    if input("Deseja continuar a visualizar? (digite 'sair' para sair): ").lower() == 'sair':
                        break
            elif acao == 3:
                break  # Sai do módulo de visualização
            else:
                print("Ação inválida, por favor escolha 1, 2 ou 3.")
        except ValueError:
            print("Por favor, digite um número válido.")


while True:
    limpar_console()
    imprimir_linhas()
    print('Olá, seja bem-vindo à central de gestão de estoque!')
    imprimir_linhas()
    print("""Aqui temos uma lista de locais de navegação: 
    1 - Cadastro de um Novo Produto                                                                                   
    2 - Visualização de produtos                                                                                               
    3 - Gerenciamento de Estoque
    4 - Relatórios
    5 - Sair""")
    imprimir_linhas()

    try:
        numerador = int(input("Digite o número do módulo para entrar: "))
    except ValueError:
        print("Por favor, digite um número válido.")
        continue

    if numerador == 1:
        while True:
            imprimir_linhas()
            print("Cadastro de um Novo Produto")
            if input("Deseja continuar ou sair desse módulo? (digite 'sair' para sair): ").lower() == 'sair':
                break
            nome = input("Digite o nome do produto: ")
            preco = float(input("Digite o valor do produto: "))
            quantidade = int(input("Digite a quantidade desse produto: "))
            vencimento = input("Digite a data de vencimento do produto (xx/yy/zzzz): ")
            estoque.adicionar_produto(nome, preco, quantidade, vencimento)
            print("Produto cadastrado com sucesso!")

    elif numerador == 2:
        menu_visualizacao()

    elif numerador == 3:
        while True:
            imprimir_linhas()                       
            print("Digite sua resposta de ação: ")
            print ("""1 - Remover produtos
            2 - Modificar produtos
            3 - sair""")
            try:
                acao = int(input("Digite a ação para execução (ou digite sair para sair): "))
                if acao == 1:
                    nome_remover = input("Digite o nome do produto que deseja remover: ")
                    estoque.remover_produto(nome_remover)
                elif acao == 2:
                    nome_modificar = input("Digite o nome do produto que deseja modificar: ")
                    novo_preco = input("Digite o novo preço (ou deixe em branco para não modificar): ")
                    nova_quantidade = input("Digite a nova quantidade (ou deixe em branco para não modificar): ")
                    novo_vencimento = input("Digite a nova data de vencimento (ou deixe em branco para não modificar): ")
                    estoque.modificar_produto(
                        nome_modificar, 
                        float(novo_preco) if novo_preco else None, 
                        int(nova_quantidade) if nova_quantidade else None, 
                        novo_vencimento if novo_vencimento else None
                    )
                elif acao == 3:
                    break
            except ValueError:
                print("Por favor, insira um número válido.")

    elif numerador == 4:
        while True:
            imprimir_linhas()
            print("Relatório de entrada e saída do estoque")
            estoque.gerar_relatorio()  
            if input("Deseja exibir um novo relatório? (digite 'sair' para sair): ").lower() == 'sair':
                break

    elif numerador == 5:
        break

if __name__ == "__main__":
    pass
