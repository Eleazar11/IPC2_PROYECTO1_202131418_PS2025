/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.database.ensamblaje;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;


/**
 *
 * @author eleaz
 */
public class ObtenerComponentes {
    private Connection connection;

    public ObtenerComponentes(Connection connection) {
        this.connection = connection;
    }

    public List<Componente> obtenerTodosLosComponentes() throws SQLException {
        List<Componente> componentes = new ArrayList<>();
        String query = "SELECT * FROM componentes";  // Consulta a la base de datos

        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                // Obtener los datos de cada fila
                String nombre = rs.getString("nombre");
                String categoriaStr = rs.getString("categoria"); // Lo tomamos como String
                double precio = rs.getDouble("precio");
                int cantidad = rs.getInt("cantidad");

                // Convertir el valor de la categoría a un valor de la enumeración CategoriaComponente
                CategoriaComponente categoria = CategoriaComponente.valueOf(categoriaStr);

                // Crear un objeto Componente y añadirlo a la lista
                Componente componente = new Componente(nombre, categoria, precio, cantidad);
                componentes.add(componente);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error al obtener los componentes.");
        }

        // Si no hay componentes, imprimir mensaje
        if (componentes.isEmpty()) {
            System.out.println("No se encontraron componentes en la base de datos.");
        }

        return componentes;
    }
}
