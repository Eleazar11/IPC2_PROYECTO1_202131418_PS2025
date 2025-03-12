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
public class ActualizarUsuario {
    private Connection connection;

    public ActualizarUsuario(Connection connection) {
        this.connection = connection;
    }

    /**
     * Actualiza el nombre y el rol de un usuario en la base de datos.
     *
     * @param username   El username del usuario a actualizar (no se puede modificar).
     * @param nuevoNombre El nuevo nombre del usuario.
     * @param nuevoRol    El nuevo rol del usuario (ENSAMBLAJE, VENTAS o ADMINISTRACION).
     * @throws SQLException En caso de error en la base de datos.
     */
    public void actualizarUsuario(String username, String nuevoNombre, String nuevoRol) throws SQLException {
        String sql = "UPDATE usuarios SET nombre = ?, rol = ? WHERE username = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, nuevoNombre);
            ps.setString(2, nuevoRol);
            ps.setString(3, username);

            int filasActualizadas = ps.executeUpdate();

            if (filasActualizadas > 0) {
                System.out.println("Usuario actualizado correctamente.");
            } else {
                System.out.println("No se encontró el usuario para actualizar.");
            }
        }
    }
}