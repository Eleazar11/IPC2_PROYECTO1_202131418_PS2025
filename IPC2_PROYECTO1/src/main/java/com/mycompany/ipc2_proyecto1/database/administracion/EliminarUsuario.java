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
public class EliminarUsuario {
    private Connection connection;

    public EliminarUsuario(Connection connection) {
        this.connection = connection;
    }

    /**
     * Elimina un usuario de la base de datos basado en su username.
     * 
     * @param username El username del usuario a eliminar.
     * @throws SQLException En caso de error en la base de datos.
     */
    public void eliminarUsuario(String username) throws SQLException {
        String sql = "DELETE FROM usuarios WHERE username = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);

            int filasEliminadas = ps.executeUpdate();

            if (filasEliminadas > 0) {
                System.out.println("Usuario eliminado correctamente.");
            } else {
                System.out.println("No se encontró el usuario para eliminar.");
            }
        }
    }
}