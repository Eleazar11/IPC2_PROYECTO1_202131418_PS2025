/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.database.ensamblaje;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author eleaz
 */
public class ActualizarComponente {
    private Connection connection;

    public ActualizarComponente(Connection connection) {
        this.connection = connection;
    }

    /**
     * Actualiza la categoría, cantidad y precio de un componente en la base de datos.
     * 
     * @param nombre El nombre del componente a actualizar.
     * @param nuevaCategoria La nueva categoría del componente.
     * @param nuevoPrecio El nuevo precio del componente.
     * @param nuevaCantidad La nueva cantidad del componente.
     * @throws SQLException En caso de error en la base de datos.
     */
    public void actualizarComponente(String nombre, String nuevaCategoria, double nuevoPrecio, int nuevaCantidad) throws SQLException {
        String sql = "UPDATE componentes SET categoria = ?, precio = ?, cantidad = ? WHERE nombre = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, nuevaCategoria);
            ps.setDouble(2, nuevoPrecio);
            ps.setInt(3, nuevaCantidad);
            ps.setString(4, nombre);
            
            int filasActualizadas = ps.executeUpdate();
            
            if (filasActualizadas > 0) {
                System.out.println("Componente actualizado correctamente.");
            } else {
                System.out.println("No se encontró el componente para actualizar.");
            }
        }
    }
}