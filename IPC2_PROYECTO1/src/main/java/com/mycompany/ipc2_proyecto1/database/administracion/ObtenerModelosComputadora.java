/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.database.administracion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author eleaz
 */
public class ObtenerModelosComputadora {
    private Connection connection;

    public ObtenerModelosComputadora(Connection connection) {
        this.connection = connection;
    }

    public List<ModeloComputadora> obtenerTodosLosModelos() throws SQLException {
        List<ModeloComputadora> modelos = new ArrayList<>();
        String query = "SELECT * FROM modelos_computadora";  // Asegúrate de que la tabla de modelos sea la correcta

        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                // Obtener los datos de cada fila
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                int cantProcesador = rs.getInt("cant_procesador");
                int cantRAM = rs.getInt("cant_ram");
                int cantTarjetaGrafica = rs.getInt("cant_tarjeta_grafica");
                int cantSSD = rs.getInt("cant_ssd");
                double precio = rs.getDouble("precio");
                boolean armada = rs.getBoolean("armada");
                boolean vendida = rs.getBoolean("vendida");

                // Crear un objeto ModeloComputadora y añadirlo a la lista
                ModeloComputadora modelo = new ModeloComputadora(id, nombre, cantProcesador, cantRAM, cantTarjetaGrafica, cantSSD, precio);
                modelo.setArmada(armada);
                modelo.setVendida(vendida);
                modelos.add(modelo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error al obtener los modelos de computadora.");
        }

        // Si no se encuentran modelos, imprimir mensaje
        if (modelos.isEmpty()) {
            System.out.println("No se encontraron modelos de computadora en la base de datos.");
        }

        return modelos;
    }
}