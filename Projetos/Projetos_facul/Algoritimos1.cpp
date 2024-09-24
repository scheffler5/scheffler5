#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <locale.h>

#define MaxVet 51 //definiçao da quantia maxima a ser avaliad pelo programa

  // Estrutura Produtos
  typedef struct { 
        char nome_produto[20];
        float valor_compra;
        float valor_venda;
        float lucro;
        int numero_venda;

    }Produtos;


//Funcao Tamanho CMD
void tamanho_tela(int largura , int altura){

    HANDLE console = GetStdHandle(STD_OUTPUT_HANDLE);
    SMALL_RECT janela_tamanho;
    COORD tamanho_buffer;

    tamanho_buffer.X = largura;
    tamanho_buffer.Y = altura;
    SetConsoleScreenBufferSize(console, tamanho_buffer);


    janela_tamanho.Top = 0 ;
    janela_tamanho.Left = 0 ;
    janela_tamanho.Right = largura - 1;
    janela_tamanho.Bottom = altura - 1;
    SetConsoleWindowInfo(console, TRUE, &janela_tamanho);
}*/




// Funcao Cabecalho
void printHeader(const char* title) {
    system("color 0A");  //Fundo preto com caracter verde
    printf("\n========================================\n");
    printf("=   %s   =\n", title);
    printf("========================================\n");
setlocale(LC_ALL, "Portuguese_Brazil.1252");
}


//Função principal
int main() {
    
    setlocale(LC_ALL, "Portuguese_Brazil.1252");//Funçaõ para permitir caracteres PT-BR
    
    printHeader("Controle de Estoque e Relatório");
    
    /*tamanho_tela(120,60);*/




//declaração de variaveis
Produtos produtos[MaxVet];
int n,i,j;
    
    printf("\nDigite a quantidade de produtos que voce deseja cadastrar: ");
        scanf("%d",&n);

    system("cls");//Funçao limpa CMD
    
    for(i=0;i<n;i++){ //loop para receber as informações sobre o produto
    printf("Digite o nome do produto %d : ",i+1);
        scanf("%19s",produtos[i].nome_produto);
    printf("Digite o valor da compra: ");
        scanf("%f",&produtos[i].valor_compra);
    printf("Digite o valor de venda: ");
        scanf("%f",&produtos[i].valor_venda);
    printf("Digite o numero de vendas: ");
        scanf("%d",&produtos[i].numero_venda);

    produtos[i].lucro=(produtos[i].valor_venda - produtos[i].valor_compra); //Calculo do lucro de cada produto
}

//Função para encontara o item cm o maior lucro
int maior_lucro = 0;
    for(i=0;i<n;i++){

    if(produtos[i].lucro>produtos[maior_lucro].lucro){
        maior_lucro=i;
    }
}

//Função para organizar os item de forma decrescente avaliando seus lucros
    Produtos temp;
    for(i = 0 ; i<n -1 ; i++){
        for(j= i + 1 ; j < n; j++){
            if(produtos[j].lucro<produtos[i].lucro){
                
                temp = produtos[i];
                produtos[i] = produtos[j];
                produtos[j] = temp;
            }
        }
    }

//Função para descobrir o produto com o maior e o menor numero de vendas
int menor_venda = 0, maior_vendas = 0;
    for(i=0;i<n;i++){


        if(produtos[i].numero_venda > produtos[maior_vendas].numero_venda){
            maior_vendas=i;
            }
    if(produtos[i].numero_venda < produtos[menor_venda].numero_venda){
        menor_venda=i;
        }
     }
    system("cls");// Função para limpar o chat
    
    //Print da funçaõ cabeçalho
    printHeader("Controle de Estoque e Relatório");
    
    // Prints sobre, lucro, numero de vendas e ordem de de produtos por lucro
    printf("\n========================================\n");
    printf("Produto com o maior lucro:\n");
    printf("\nNome: %s \nLucro : %.2f\n",produtos[maior_lucro].nome_produto, produtos[maior_lucro].lucro);
    
    printf("\n========================================\n");
    printf("\nProdutos ordenados por lucro em ordem:\n");
    for(i = 0 ; i < n ; i++){
        printf("\nNome: %s, Lucro: %.2f\n", produtos[i].nome_produto, produtos[i].lucro);

    }
    printf("\n========================================\n");
    printf("\nProduto com o maior numero de vendas:\n");
    printf("\nNome: %s \nNumero de Vendas: %d\n", produtos[maior_vendas].nome_produto, produtos[maior_vendas].numero_venda);
    
    printf("\n========================================\n");
    printf("\nProduto com o menor numero de venda:\n");
    printf("\nNome: %s \nNumero de Vendas: %d\n", produtos[menor_venda].nome_produto, produtos[menor_venda].numero_venda);
    printf("\n========================================\n");

    printf("\n\n\n\n\n");// Print apenas para espaçar o fim da função main
   
   return 0;
 
}
