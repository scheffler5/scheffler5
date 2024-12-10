/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author gabri
 */
public class CompLadorAngulo implements CalcArea{
    private double lado1;
    private double lado2;
    private double lado3;

    public CompLadorAngulo(double lado1, double lado2, double lado3) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    
    @Override
    public void area() {
        
    }

    @Override
    public void perimetro() {
        
    }
    public double angulos(double lado1, double lado2, double oppositeSide){
        double cosAngle = (Math.pow(lado1, 2) + Math.pow(lado2, 2) - Math.pow(oppositeSide, 2)) / (2 * lado1 * lado2);
        return Math.toDegrees(Math.acos(cosAngle));
        
    }
    
}
