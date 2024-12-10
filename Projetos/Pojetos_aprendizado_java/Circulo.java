/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author gabri
 */
public class Circulo implements iFormasGeometricas{
    private double raio;
    private double pi = 3.14;
    @Override
    public double Area() {
        double area = pi*(Math.pow(raio, 2));
        return area;
    }

    @Override
    public double Perimetro() {
        double perimetro = 2*pi*raio;
        return perimetro;
    }

    public Circulo(double raio) {
        this.raio = raio;
    }
    
}
