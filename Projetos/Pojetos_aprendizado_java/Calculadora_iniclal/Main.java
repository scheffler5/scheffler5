/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.util.Scanner;
/**
 *
 * @author gabri
 */
public class Main {
    public static void main(String[] args){
        Calculadora c = new Calculadora("");
        Scanner s = new Scanner(System.in);
        System.out.println("Inicializando a calculadora.....");
        System.out.println("Seja bem vindo a calculadora online!");
        while (true){
            System.out.println("Qual tipo de contas matematica consecutiva voce deseja relizar primeiro ");
            System.out.println("soma");
            System.out.println("subtracao");
            System.out.println("multiplicacao");
            System.out.println("divisao");
            System.out.print("Digite sua escolha: ");
            String acao = s.nextLine();
            c.acao(acao);
            System.out.println("Deseja continuar nas operacoes ou sair da calculadora? ");
            System.out.print("Digite 'sair' para sair da calculadora ou continuar para voltar ate o inicio: ");
            s.nextLine();
            String finalize = s.nextLine();
            if (finalize.equalsIgnoreCase("sair")){
                System.out.println("Voce esta saindo do programa.....");
                break;
            }else{
                System.out.println("Voltando ao inicio.....");
            }
        
        
        }
        
    }
}
