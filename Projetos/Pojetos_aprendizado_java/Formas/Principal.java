
import java.util.Scanner;

public class Principal{
    public static void main(String[] args){
        //Equilatero e = new Equilatero(2,2,2);
        Scanner s = new Scanner(System.in);
        //CompLadorAngulo c = new CompLadorAngulo(3,4,5);
        while (true){
        System.out.println("Digite o que voce deseja calcular de area: ");
        System.out.println("Triangulo(t)/Quadrado(q)/Circulo(c)");
        String acao = s.nextLine();
            if (acao.toLowerCase().equalsIgnoreCase("t")){
                System.out.println("Qual tipo de expressao de triangulo voce deseja realizar?");
                System.out.println("Angulos(1)/Area de equilatero(2)/area normal(3)/Heron");
                int numero = s.nextInt();
                switch (numero){
                    case 1: 
                        System.out.println("Digite o lado a: ");
                        double lado1 = s.nextDouble();

                        System.out.println("Digite o lado b: ");
                        double lado2 = s.nextDouble();

                        System.out.println("Digite o lado c: ");
                        double lado3 = s.nextDouble();
                        CompLadorAngulo c = new CompLadorAngulo(lado1,lado2,lado3);
                        double ang1 = c.angulos(lado2, lado3, lado1);
                        double ang2 = c.angulos(lado1, lado3, lado1);
                        double ang3 = c.angulos(lado1, lado2, lado3);

                        System.out.printf("Ângulo A: %.2f graus%n", ang1);
                        System.out.printf("Ângulo B: %.2f graus%n", ang2);
                        System.out.printf("Ângulo C: %.2f graus%n", ang3);
                        break;
                    case 2:
                        System.out.println("Digite o lado a: ");
                        double ladoa = s.nextDouble();

                        System.out.println("Digite o lado b: ");
                        double ladob = s.nextDouble();

                        System.out.println("Digite o lado c: ");
                        double ladoc = s.nextDouble();
                        Equilatero e = new Equilatero(ladoa,ladob,ladoc);

                        e.area();
                        e.perimetro();
                        break;
                    case 3: 
                        System.out.println("Digite o lado a: ");
                        double ladox = s.nextDouble();

                        System.out.println("Digite o lado b: ");
                        double ladoy = s.nextDouble();

                        System.out.println("Digite o lado c: ");
                        double ladoz = s.nextDouble();
                        BaseAltura ba = new BaseAltura(ladox,ladoy,ladoz);
                        ba.area();
                        break;
                    case 4:
                        System.out.println("Digite o lado a: ");
                        double ladod = s.nextDouble();

                        System.out.println("Digite o lado b: ");
                        double ladoe = s.nextDouble();

                        System.out.println("Digite o lado c: ");
                        double ladof = s.nextDouble();
                        Heron h = new Heron(ladod,ladoe,ladof);
                        h.area();
                        h.perimetro();
                        break;
                
                }

            }else if(acao.toLowerCase().equalsIgnoreCase("q")){
                System.out.println("Digite o lado a: ");
                double lado = s.nextDouble();
                Quadrado q = new Quadrado(lado);
                System.out.println("A area eh: "+q.Area());
                System.out.println("O perimetro eh: "+q.Perimetro());
                break;

            }else if(acao.toLowerCase().equalsIgnoreCase("c")){
                System.out.println("Digite o raio a: ");
                double raio = s.nextDouble();
                Circulo ci = new Circulo(raio);
                System.out.println("A area eh: "+ci.Area());
                System.out.println("O perimetro eh: "+ci.Perimetro());
                break;
            }else{
                System.out.println("Esta letra nao corresponde! ");
            }
            }
        
    }}
    

