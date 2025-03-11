/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.database.ensamblaje;

import com.mycompany.ipc2_proyecto1.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author eleaz
 */
public class InsertarComponente {
    private Connection connection;

    public InsertarComponente(Connection connection) {
        this.connection = connection;
    }
    
    /**
     * Verifica si el username de usuario ya existe en la base de datos.
     * 
     * @param nombre El nombre del componente se verifica.
     * @return true si el componente existe, false en caso contrario.
     * @throws SQLException En caso de error en la base de datos.
     */
    public boolean componenteExiste(String nombre) throws SQLException {
        String sql = "SELECT COUNT(*) FROM componentes WHERE nombre = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, nombre);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Retorna true si hay al menos un usuario con ese nombre
                }
            }
        }
        return false;
    }

    /**
     * Registra un nuevo componente en la base de datos.
     * 
     * @param componente El objeto Componente que se desea registrar.
     * @throws SQLException En caso de error en la base de datos.
     */
    public void registrarComponente(Componente componente) throws SQLException {
        String sql = "INSERT INTO componentes (nombre, categoria, precio, cantidad) VALUES  (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, componente.getNombre());
            ps.setString(2, componente.getCategoriaComponente().toString());
            ps.setDouble(3, componente.getPrecio());
            ps.setInt(4, componente.getCantidad());
            ps.executeUpdate();
        }
    }
}
