/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.database.administracion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author eleaz
 */
public class ActualizarModeloComputadora {
    private Connection connection;

    public ActualizarModeloComputadora(Connection connection) {
        this.connection = connection;
    }

    /**
     * Actualiza la cantidad de RAM, cantidad de tarjetas gráficas, cantidad de SSD, 
     * precio, si está armada y si está vendida de un modelo de computadora en la base de datos.
     * 
     * @param nombre El nombre del modelo de computadora a actualizar.
     * @param nuevaCantidadRAM La nueva cantidad de RAM.
     * @param nuevaCantidadTarjetasGraficas La nueva cantidad de tarjetas gráficas.
     * @param nuevaCantidadSSD La nueva cantidad de SSD.
     * @param nuevoPrecio El nuevo precio del modelo.
     * @param nuevaCantidadArmada El nuevo estado de si está armada (true o false).
     * @param nuevaCantidadVendida El nuevo estado de si está vendida (true o false).
     * @throws SQLException En caso de error en la base de datos.
     */
    public void actualizarModeloComputadora(String nombre, int nuevaCantidadRAM, int nuevaCantidadTarjetasGraficas, 
                                            int nuevaCantidadSSD, double nuevoPrecio, boolean nuevaCantidadArmada, 
                                            boolean nuevaCantidadVendida) throws SQLException {
        String sql = "UPDATE modelos_computadora SET cant_RAM = ?, cant_tarjeta_grafica = ?, cant_SSD = ?, " + 
                     "precio = ?, armada = ?, vendida = ? WHERE nombre = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, nuevaCantidadRAM);
            ps.setInt(2, nuevaCantidadTarjetasGraficas);
            ps.setInt(3, nuevaCantidadSSD);
            ps.setDouble(4, nuevoPrecio);
            ps.setBoolean(5, nuevaCantidadArmada);
            ps.setBoolean(6, nuevaCantidadVendida);
            ps.setString(7, nombre);
            
            int filasActualizadas = ps.executeUpdate();
            
            if (filasActualizadas > 0) {
                System.out.println("Modelo de computadora actualizado correctamente.");
            } else {
                System.out.println("No se encontró el modelo de computadora para actualizar.");
            }
        }
    }
}
