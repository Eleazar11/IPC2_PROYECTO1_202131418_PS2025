/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.database.ensamblaje;

/**
 *
 * @author eleaz
 */
public class Componente {
    private String nombre;
    private CategoriaComponente CategoriaComponente;
    private double precio;
    private int cantidad;

    public Componente(String nombre, CategoriaComponente CategoriaComponente, double precio, int cantidad) {
        this.nombre = nombre;
        this.CategoriaComponente = CategoriaComponente;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public CategoriaComponente getCategoriaComponente() {
        return CategoriaComponente;
    }

    public void setCategoriaComponente(CategoriaComponente CategoriaComponente) {
        this.CategoriaComponente = CategoriaComponente;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
        @Override
    public String toString() {
        return "Componente{" +
                "nombre='" + nombre + '\'' +
                ", categoriaComponente=" + CategoriaComponente +
                ", precio=" + precio +
                ", cantidad=" + cantidad +
                '}';
    }
    
}
