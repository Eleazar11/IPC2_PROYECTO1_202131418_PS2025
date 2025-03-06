/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.database;

import com.mycompany.ipc2_proyecto1.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author eleaz
 */
public class InsertarUsuario {

    private Connection connection;

    public InsertarUsuario(Connection connection) {
        this.connection = connection;
    }

    /**
     * Verifica si el username de usuario ya existe en la base de datos.
     * 
     * @param username El username de usuario a verificar.
     * @return true si el usuario existe, false en caso contrario.
     * @throws SQLException En caso de error en la base de datos.
     */
    public boolean usuarioExiste(String username) throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE username = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Retorna true si hay al menos un usuario con ese nombre
                }
            }
        }
        return false;
    }

    /**
     * Registra un nuevo usuario en la base de datos.
     * 
     * @param usuario El objeto Usuario que se desea registrar.
     * @throws SQLException En caso de error en la base de datos.
     */
    public void registrarUsuario(Usuario usuario) throws SQLException {
        String sql = "INSERT INTO usuarios (nombre, username, password, rol) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getUsername());
            ps.setString(3, usuario.getContrasena());
            ps.setString(4, usuario.getTipoUsuario().toString());
            ps.executeUpdate();
        }
    }
}