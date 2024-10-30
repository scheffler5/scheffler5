/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.util.Scanner;
import java.util.HashMap;
/**
 *
 * @author gabri
 */
public class main {
    public static void main (String[] args){
        Scanner s = new Scanner(System.in);
            Produto p = new Produto();
        while (true) {
            System.out.println("Escolha uma opção:");
            System.out.println("1 - Cadastrar produto");
            System.out.println("2 - Atualizar quantidade de um produto");
            System.out.println("3 - Atualizar preço de um produto");
            System.out.println("4 - Exibir todos os produtos");
            System.out.println("5 - Sair");
            int opcao = s.nextInt();
            s.nextLine(); // Limpa o buffer

            switch (opcao) {
                case 1:
                    System.out.print("Digite o Nome do Item: ");
                    String nome = s.nextLine();
                    System.out.print("Digite a Descrição do Item: ");
                    String descricao = s.nextLine();
                    System.out.print("Digite a Quantidade do Item: ");
                    int quantidade = s.nextInt();
                    System.out.print("Digite o Valor do Item: ");
                    double valor = s.nextDouble();
                    s.nextLine();

                    Produto novoProduto = new Produto(nome, descricao, quantidade, valor);
                    p.adicionarProduto(nome, novoProduto);
                    System.out.println("Produto cadastrado com sucesso!\n");
                    break;

                case 2:
                    System.out.print("Digite o Nome do Produto para atualizar a quantidade: ");
                    String nomeAtualizarQtd = s.nextLine();
                    System.out.print("Digite a nova quantidade: ");
                    int novaQuantidade = s.nextInt();
                    s.nextLine();

                    p.atualizarQuantidade(nomeAtualizarQtd, novaQuantidade);
                    break;

                case 3:
                    System.out.print("Digite o Nome do Produto para atualizar o preço: ");
                    String nomeAtualizarPreco = s.nextLine();
                    System.out.print("Digite o novo valor: ");
                    double novoValor = s.nextDouble();
                    s.nextLine();

                    p.atualizarPreco(nomeAtualizarPreco, novoValor);
                    break;

                case 4:
                    p.exibir();
                    break;

                case 5:
                    System.out.println("Saindo...");
                    s.close();
                    return;

                default:
                    System.out.println("Opção inválida! Tente novamente.");
            }  
    }
}
}
