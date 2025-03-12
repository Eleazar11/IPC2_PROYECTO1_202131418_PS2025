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
public class EliminarComponente {
    private Connection connection;

    public EliminarComponente(Connection connection) {
        this.connection = connection;
    }

    /**
     * Elimina un componente de la base de datos basado en su nombre.
     * 
     * @param nombre El nombre del componente a eliminar.
     * @throws SQLException En caso de error en la base de datos.
     */
    public void eliminarComponente(String nombre) throws SQLException {
        String sql = "DELETE FROM componentes WHERE nombre = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, nombre);
            
            int filasEliminadas = ps.executeUpdate();
            
            if (filasEliminadas > 0) {
                System.out.println("Componente eliminado correctamente.");
            } else {
                System.out.println("No se encontró el componente para eliminar.");
            }
        }
    }
}
