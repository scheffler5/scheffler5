import java.util.Scanner;
import java.util.HashMap;
/**
 *
 * @author gabri
 */
public class Produto {
    private String nome;
    private double valor;
    private String descricao;
    private double estoqueMAX = 100;
    private double estoqueMIN = 1;
    private int quantidade = 0;
    Scanner scanner = new Scanner(System.in);
    private HashMap<String, Produto> estoques = new HashMap<>();
    
    public Produto(String nome, String descricao, int quantidade, double valor) {
        this.nome = nome;
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.valor = valor;
    }
    public Produto(){
        estoques = new HashMap<>();
        
    }
    public void adicionarProduto(String nome, Produto produto) {
        estoques.put(nome, produto); 
        alertaMAX();
        alertaMIN();
    }
    public void alertaMAX(){
        if (this.quantidade > (estoqueMAX * 0.9)){
            System.out.printf("Seu estoque esta em %d e esta quase alcancando o maximo do estoque que eh %.2f",quantidade,estoqueMAX);
        }
    }
    public void excluir(){
        while (true){
            System.out.print("Agora Digite a quantidade de itens que deseja inserir: ");
            int excluir = scanner.nextInt();
            if ((excluir + quantidade) > estoqueMAX){
                System.out.println("Esta operacao nao pode ser executada pois excede o maximo do estoque!!");
                double Diferenca = estoqueMAX - quantidade;
                System.out.printf("Voce apenas pode inserir esta quantidade no estoque %f, para que nao exceda o maximo de %f",Diferenca, estoqueMAX);
            }else if ((excluir + quantidade)<= estoqueMAX){
                System.out.printf("Foram adicionados %d itens no estoque",excluir);
                quantidade += excluir;
            }else{
                System.out.println("Saindo do incluir itens.....");
                break;
            }
        }
    }
    public void alertaMIN(){
        if (this.quantidade < (estoqueMIN * 10)){
            System.out.printf("Seu estoque esta em %d e esta quase passando do minimo do estoque que eh %.2f",quantidade,estoqueMAX);
        }
    }
    @Override
    public String toString() {
        return "Produto{" +
                "nome='" + nome + '\'' +
                ", descricao='" + descricao + '\'' +
                ", quantidade=" + quantidade +
                ", valor=" + valor +
                '}';
    }
    public void exibir() {
        System.out.println("Lista de produtos:");
        for (Produto produto : estoques.values()) {
            System.out.println(produto);
        }
    }
    public void atualizarQuantidade(String nome, int novaQuantidade) {
        Produto produto = estoques.get(nome);
        if (produto != null) {
            produto.quantidade = novaQuantidade;
            System.out.println("Quantidade atualizada com sucesso para o produto: " + nome);
            alertaMAX();
            alertaMIN();
        } else {
            System.out.println("Produto não encontrado.");
        }
    }
    public void atualizarPreco(String nome, double novoValor) {
        Produto produto = estoques.get(nome);
        if (produto != null) {
            produto.valor = novoValor;
            System.out.println("Preço atualizado com sucesso para o produto: " + nome);
        } else {
            System.out.println("Produto não encontrado.");
        }
    }
    
}
