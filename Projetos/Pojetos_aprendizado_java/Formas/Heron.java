/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author gabri
 */
public class Heron implements CalcArea{
    private double lado1;
    private double lado2;

    public Heron(double lado1, double lado2, double lado3) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    private double lado3;
    private double perimetro;
    private double area;

    
    @Override
    public void perimetro(){
        perimetro = lado1 +lado2 + lado3;
        System.out.println("Seu perimetro por Heron é: "+perimetro);
    }
    @Override
    public void area(){
        double semiperimetro = (lado1 + lado2 + lado3)/2;
        double s = semiperimetro* (semiperimetro - lado1)* (semiperimetro - lado2)*(semiperimetro - lado3);
        double raiz = Math.sqrt(s);
        System.out.println("Sua Area por Heron é: "+raiz);
    }
}
