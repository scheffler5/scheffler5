import java.util.Scanner;
/**
 *
 * @author gabri
 */
public class Calculadora {

    private double resultado = 0;
    private String acao;
    Scanner scanner = new Scanner(System.in);
    public Calculadora(String acao){
        this.acao = acao;
        
    }
    public void acao(String acao){
        if (acao.equalsIgnoreCase("soma")){
            System.out.println("Voce esta em Soma");
            soma();
        }
        else if (acao.equalsIgnoreCase("subtracao")){
            System.out.println("Voce esta em subtracao");
            subtracao();
        }
        else if (acao.equalsIgnoreCase("multiplicacao")){
            System.out.println("Voce esta em multiplicacao");
            multiplicacao();
        }
        else if (acao.equalsIgnoreCase("divisao")){
            System.out.println("Voce esta em divisao");
            divisao();
        }
    }
    
    public void soma(){
        System.out.println("Digite os dois numeros, para realizar a operacao");
        System.out.print("Primeiro numero: ");
        double numero = scanner.nextDouble();
        System.out.print("Primeiro numero: ");
        double numero1 = scanner.nextDouble();
        resultado = numero + numero1;
        System.out.println("\nDeseja finalizar as operacoes e ver o resultado ou continuar a fazer somas consecutivas em cima do resultado?");
        System.out.print("'sair' para finalizar ou 'continuar para continuar: ");
        scanner.nextLine();
        String decisao = scanner.nextLine();
        
        if (decisao.equalsIgnoreCase("sair")){
            System.out.printf("Seu resultado da soma de %.2f + %.2f = %.2f",numero,numero1,resultado);
        }else{
            while (true){
            System.out.print("\nDigite o numero que ira somar com o resultado: ");
            scanner.nextLine();
            double numero2 = scanner.nextDouble();
            resultado = resultado + numero2;
            System.out.print("Voce deseja continuar, ou digite '=' para sair: ");
            scanner.nextLine();
            decisao = scanner.nextLine();
            if (decisao.equalsIgnoreCase("=")){
                System.out.printf("Seu resultado e: %.2f",resultado);
                break;
            }else{
                System.out.println("Continuando...");
            }
            }
        }
    }
    public void subtracao(){
        System.out.println("Digite os dois numeros, para realizar a operacao");
        System.out.print("Primeiro numero: ");
        double numero = scanner.nextDouble();
        System.out.print("Primeiro numero: ");
        double numero1 = scanner.nextDouble();
        resultado = numero - numero1;
        System.out.println("\nDeseja finalizar as operacoes e ver o resultado ou continuar a fazer subtracoes consecutivas em cima do resultado?");
        System.out.print("'sair' para finalizar ou 'continuar para continuar: ");
        scanner.nextLine();
        String decisao = scanner.nextLine();
        if (decisao.equalsIgnoreCase("sair")){
            System.out.printf("Seu resultado da subtracao de %.2f - %.2f = %.2f",numero,numero1,resultado);
        }else{
            while (true){
            System.out.print("\nDigite o numero que ira subtrair com o resultado: ");
            scanner.nextLine();
            double numero2 = scanner.nextDouble();
            resultado -= numero2;
            System.out.print("Voce deseja continuar, ou digite '=' para sair: ");
            scanner.nextLine();
            decisao = scanner.nextLine();
            if (decisao.equalsIgnoreCase("=")){
                System.out.printf("Seu resultado e: %.2f",resultado);
                break;
            }else{
                System.out.println("Continuando...");
            }
            }
        }
    }
    public void multiplicacao(){
        System.out.println("Digite os dois numeros, para realizar a operacao");
        System.out.print("Primeiro numero: ");
        double numero = scanner.nextDouble();
        System.out.print("Primeiro numero: ");
        double numero1 = scanner.nextDouble();
        resultado = numero * numero1;
        System.out.println("\nDeseja finalizar as operacoes e ver o resultado ou continuar a fazer multiplicacoes consecutivas em cima do resultado?");
        System.out.print("'sair' para finalizar ou 'continuar para continuar: ");
        scanner.nextLine();
        String decisao = scanner.nextLine();
        if (decisao.equalsIgnoreCase("sair")){
            System.out.printf("Seu resultado da multiplicacao de %.2f x %.2f = %.2f",numero,numero1,resultado);
        }else{
            while (true){
            System.out.print("\nDigite o numero que ira multiplicar com o resultado: ");
            scanner.nextLine();
            double numero2 = scanner.nextDouble();
            resultado *= numero2;
            System.out.print("Voce deseja continuar, ou digite '=' para sair: ");
            scanner.nextLine();
            decisao = scanner.nextLine();
            if (decisao.equalsIgnoreCase("=")){
                System.out.printf("Seu resultado e: %.2f",resultado);
                break;
            }else{
                System.out.println("Continuando...");
            }
            }
        }
    }
    public void divisao(){
        System.out.println("Digite os dois numeros, para realizar a operacao");
        System.out.print("Primeiro numero: ");
        double numero = scanner.nextDouble();
        System.out.print("Primeiro numero: ");
        double numero1 = scanner.nextDouble();
        resultado = numero / numero1;
        System.out.println("\nDeseja finalizar as operacoes e ver o resultado ou continuar a fazer divisoes consecutivas em cima do resultado?");
        System.out.print("'sair' para finalizar ou 'continuar para continuar: ");
        scanner.nextLine();
        String decisao = scanner.nextLine();
        
        if (decisao.equalsIgnoreCase("sair")){
            System.out.printf("Seu resultado da divisao de %.2f divido com %.2f = %.2f",numero,numero1,resultado);
        }else{
            while (true){
            System.out.print("\nDigite o numero que ira dividir com o resultado: ");
            scanner.nextLine();
            double numero2 = scanner.nextDouble();
            resultado /= numero2;
            System.out.print("Voce deseja continuar, ou digite '=' para sair: ");
            scanner.nextLine();
            decisao = scanner.nextLine();
            if (decisao.equalsIgnoreCase("=")){
                System.out.printf("Seu resultado e: %.2f",resultado);
                break;
            }else{
                System.out.println("Continuando...");
            }
            }
        }
    }
    
}
