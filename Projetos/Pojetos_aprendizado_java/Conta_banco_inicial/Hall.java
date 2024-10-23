/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.util.Scanner;
import java.util.Stack;
public class Hall {
    
    public static void main(String[] args){
        
        Stack<Conta> contas = new Stack<>();
        while (true){
            
        
            System.out.println("Digite seu nome e Numero da conta para verificarmos se voce esta cadastrado no sistema!");
            System.out.print("Digite seu nome: ");
            Scanner s = new Scanner(System.in);
            String nome = s.nextLine();

            System.out.print("Digite o numero da sua conta: ");
            String NumeroConta = s.nextLine();
            double saldo = 0;
            System.out.println("Agora Voce esta dentro de sua conta! ");
            System.out.println("O que voce deseja fazer?  ");
            Conta c = new Conta(nome,NumeroConta,saldo);
            contas.push(c);
            while(true){
                System.out.println("Digite 1 para Depositar");
                System.out.println("Digite 2 para Sacar");
                System.out.println("Digite 3 para Transferir");
                System.out.println("Digite 4 para ver o Saldo na conta corrente");
                System.out.println("Digite 5 para ver o Saldo na conta poupança");
                System.out.print("--->");
                int acao = s.nextInt();
                c.acao(acao);
                System.out.println("Digite qual opção de acao voce deseja fazer ou digite:");
                System.out.println("'sair' para sair do sistema ou 'criar' para criar outra conta");
                s.nextLine();
                String sair = s.nextLine();
                if (sair.equalsIgnoreCase("criar")){
                    System.out.println("Criar outra conta.....");
                    break;
                }else if (sair.equalsIgnoreCase("sair")){
                    System.out.println("Saindo do sistema.....");
                }
                else{
                    System.out.println("Faça sua escolha: ");
                }
            }
        }
        
        
    }
}