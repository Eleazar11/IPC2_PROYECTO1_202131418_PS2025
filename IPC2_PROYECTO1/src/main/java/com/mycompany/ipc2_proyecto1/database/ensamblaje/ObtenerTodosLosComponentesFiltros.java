/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.database.ensamblaje;

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
public class ObtenerTodosLosComponentesFiltros {
    private Connection connection;

    public ObtenerTodosLosComponentesFiltros(Connection connection) {
        this.connection = connection;
    }

    public List<Componente> obtenerComponentesConFiltros(String ordenarPor, String orden) throws SQLException {
        List<Componente> componentes = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT * FROM componentes");

        // Añadir ordenamiento
        if (ordenarPor != null && !ordenarPor.isEmpty()) {
            query.append(" ORDER BY ").append(ordenarPor);
            if (orden != null && orden.equalsIgnoreCase("desc")) {
                query.append(" DESC");
            }
        }

        try (PreparedStatement stmt = connection.prepareStatement(query.toString());
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String nombre = rs.getString("nombre");
                String categoriaStr = rs.getString("categoria");
                double precio = rs.getDouble("precio");
                int cantidad = rs.getInt("cantidad");

                CategoriaComponente categoria = CategoriaComponente.valueOf(categoriaStr);

                Componente componente = new Componente(nombre, categoria, precio, cantidad);
                componentes.add(componente);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error al obtener los componentes con filtros.");
        }

        return componentes;
    }
}
