import java.util.Scanner;

public class Conta {
    private String nome;
    private String NumeroConta;
    private double saldo;
    private double saldop;
    
    Scanner scanner = new Scanner(System.in);
    
    public Conta(String nome, String NumeroConta,double saldo){
        
        if (Verifica(nome) && Verificas(NumeroConta)) {
            this.nome = nome;
            this.NumeroConta = NumeroConta;
            this.saldo = saldo;
            System.out.println("Conta criada com sucesso para " + nome + "!");
        } else {
            System.out.println("Nome inválido! A conta não foi criada.");
        }
        print();
    }
    public void depositar(){
        System.out.println("Qual tipo de conta deseja depositar: ");
        System.out.println("Corrente, digite 1 ");
        System.out.println("Poupanca, digite 2 ");
        int tipo = scanner.nextInt();
        int depositar;
        if (tipo == 1){
            System.out.println("Voce pode depositar ate R$ 5.000");
            System.out.println("Quanto voce quer depositar?");
            depositar = scanner.nextInt();
            if (depositar <= 5000){
                saldo += depositar; 
                printsaldo();
           }else{
                System.out.println("Voce digitou um valor maior que o referido anteriormente!");
            }}
        
        else if (tipo == 2){
            System.out.println("Voce pode depositar o tanto quanto desejar");
            System.out.println("Quanto voce quer depositar?");
            depositar = scanner.nextInt();
            saldop += depositar ;
            printsaldop();
        }
       
        
    }
    public void sacar(){
        double sacar;
        System.out.println("Voce quer sacar quanto?");
        sacar = scanner.nextDouble();
        if (sacar > (saldo+saldop)){
            System.out.println("Voce nao pode sacar mais que o seu saldo!");
        }else{
            saldo = (saldo + saldop) - sacar;
            printsaldo();
        }
        
        
    }
    public void transferir(){
        double quantidade;
        System.out.println("Voce pode realizar transferencias apenas de contas corrente para contas poupancas");
        System.out.println("Quanto voce deseja tranferir da conta corrente para a poupanca? ");
        quantidade = scanner.nextDouble();
        if (quantidade > saldo){
            System.out.println("Voce nao pode transferir mais do que tem na sua conta corrente! ");
        }else{
            saldo = saldo - quantidade;
            saldop = saldop + quantidade;
        }
        
        
        
    }
    public void acao(int acao){
        if (acao == 1){
            depositar();
        }
        else if (acao == 2){
            sacar();
        }
        else if (acao == 3){
            transferir();
        }
        else if (acao == 4){
            printsaldo();
        }
        else if (acao == 5){
            printsaldop();
        }
        
        else{
            System.out.println("Voce nao digitou um numero valido!");
            
        }
        
    }
    private boolean Verifica(String nome) {
        return nome != null && !nome.trim().isEmpty();
        
    }
    private boolean Verificas(String NumeroConta) {
        return NumeroConta != null && !NumeroConta.trim().isEmpty();
    }
    public String getnome(){
        return nome;
    }
    public String getNumeroConta(){
        return NumeroConta;
    }
    public double getsaldo(){
        return saldo;
    }
    
    public void printsaldo(){
        System.out.printf("Seu saldo e: R$%.2f\n",saldo);
    }
    public double getsaldop(){
        return saldop;
    }
    
    public void printsaldop(){
        System.out.printf("Seu saldo e: R$%.2f\n",saldop);
    }
    public void print(){
        System.out.printf("Nome: %s\nNumero da Conta: %s\n", getnome(),getNumeroConta());
    }
}
