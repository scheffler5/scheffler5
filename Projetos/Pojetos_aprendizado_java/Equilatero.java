/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author gabri
 */
public class Equilatero implements CalcArea{
    private double lado1;
    private double lado2;
    private double lado3;
    private double area;
    private double perimetro;
    private CompLadorAngulo comp;

    public Equilatero(double lado1, double lado2, double lado3) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    
    
    @Override
    public void area() {
            this.area = area;
            double altura = (lado1 *lado1)- ((lado1*lado1)/4);
            area = (lado1 * altura)/2;
            System.out.printf("Area: %f\n",area);
        
        }

    @Override
    public void perimetro() {
            this.perimetro = perimetro;
            perimetro = lado1 * 3;
            System.out.printf("perimetro do Equilatero: %f\n",perimetro);    
        
        }
    

    
    
}
