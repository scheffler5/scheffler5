/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author gabri
 */
public class Quadrado implements iFormasGeometricas {
    private double lado;
    @Override
    public double Area() {
        double area = Math.pow(lado,2);
        return area;
    }

    @Override
    public double Perimetro() {
        double perimetro = 4*lado;
        return perimetro;
    }

    public Quadrado(double lado) {
        this.lado = lado;
    }
    
}
