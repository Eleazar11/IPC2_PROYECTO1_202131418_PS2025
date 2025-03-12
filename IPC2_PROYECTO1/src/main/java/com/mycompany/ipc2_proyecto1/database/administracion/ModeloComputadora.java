/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.database.administracion;

/**
 *
 * @author eleaz
 */
public class ModeloComputadora {
    private int id;
    private String nombre;
    private int cantProcesador;
    private int cantRAM;
    private int cantTarjetaGrafica;
    private int cantSSD;
    private double precio;
    private boolean armada;
    private boolean vendida;

    public ModeloComputadora(String nombre, int cantProcesador, int cantRAM, int cantTarjetaGrafica, int cantSSD, double precio) {
        this.nombre = nombre;
        this.cantProcesador = cantProcesador;
        this.cantRAM = cantRAM;
        this.cantTarjetaGrafica = cantTarjetaGrafica;
        this.cantSSD = cantSSD;
        this.precio = precio;
    }

    public ModeloComputadora(int id, String nombre, int cantProcesador, int cantRAM, int cantTarjetaGrafica, int cantSSD, double precio) {
        this.id = id;
        this.nombre = nombre;
        this.cantProcesador = cantProcesador;
        this.cantRAM = cantRAM;
        this.cantTarjetaGrafica = cantTarjetaGrafica;
        this.cantSSD = cantSSD;
        this.precio = precio;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public int getCantProcesador() {
        return cantProcesador;
    }

    public int getCantRAM() {
        return cantRAM;
    }

    public int getCantTarjetaGrafica() {
        return cantTarjetaGrafica;
    }

    public int getCantSSD() {
        return cantSSD;
    }

    public double getPrecio() {
        return precio;
    }

    public boolean isArmada() {
        return armada;
    }

    public boolean isVendida() {
        return vendida;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setCantProcesador(int cantProcesador) {
        this.cantProcesador = cantProcesador;
    }

    public void setCantRAM(int cantRAM) {
        this.cantRAM = cantRAM;
    }

    public void setCantTarjetaGrafica(int cantTarjetaGrafica) {
        this.cantTarjetaGrafica = cantTarjetaGrafica;
    }

    public void setCantSSD(int cantSSD) {
        this.cantSSD = cantSSD;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public void setArmada(boolean armada) {
        this.armada = armada;
    }

    public void setVendida(boolean vendida) {
        this.vendida = vendida;
    }

    
    
}
