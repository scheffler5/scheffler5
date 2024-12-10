/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author gabri
 */
public class Triangulo{
    private CalcArea calcarea;
    private Equilatero equilatero;
    private Heron heron;
    public Triangulo(){
        
    }
    
    public void resultado(String resultado){
        if (resultado.toLowerCase().equals("equilatero")){
            equilatero.area();
        }else if (resultado.toLowerCase().equals("heron")){
            heron.area();
        }
    }
    public void Area(double area) {
     
    }
    public void Perimetro(double perimetro) {
        
    }
    
}
