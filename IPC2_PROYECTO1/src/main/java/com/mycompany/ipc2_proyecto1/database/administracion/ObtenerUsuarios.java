/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.database.administracion;

import com.mycompany.ipc2_proyecto1.TipoUsuario;
import com.mycompany.ipc2_proyecto1.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author eleaz
 */
public class ObtenerUsuarios {
    private Connection connection;

    public ObtenerUsuarios(Connection connection) {
        this.connection = connection;
    }

    public List<Usuario> obtenerTodosLosUsuarios() throws SQLException {
        List<Usuario> usuarios = new ArrayList<>();
        String query = "SELECT * FROM usuarios";  // Asegúrate de que la tabla de usuarios se llama "usuarios"

        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                // Obtener los datos de cada fila
                String nombre = rs.getString("nombre");
                String username = rs.getString("username");
                String contrasena = rs.getString("password");
                String tipoUsuarioStr = rs.getString("rol"); // Lo tomamos como String

                // Convertir el valor del tipo de usuario a un valor de la enumeración TipoUsuario
                // Convertimos el valor a minúsculas antes de pasarlo a la enumeración
                TipoUsuario tipoUsuario = TipoUsuario.valueOf(tipoUsuarioStr.toLowerCase());

                // Crear un objeto Usuario y añadirlo a la lista
                Usuario usuario = new Usuario(nombre, username, contrasena, tipoUsuario);
                usuarios.add(usuario);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error al obtener los usuarios.");
        }

        // Si no hay usuarios, imprimir mensaje
        if (usuarios.isEmpty()) {
            System.out.println("No se encontraron usuarios en la base de datos.");
        }

        return usuarios;
    }
}
