/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.database.administracion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author eleaz
 */
public class InsertarModeloComputadora {
    private Connection connection;

    public InsertarModeloComputadora(Connection connection) {
        this.connection = connection;
    }

    /**
     * Verifica si el modelo de computadora con el mismo nombre ya existe en la base de datos.
     * 
     * @param nombre El nombre del modelo de computadora.
     * @return true si el modelo de computadora existe, false en caso contrario.
     * @throws SQLException En caso de error en la base de datos.
     */
    public boolean modeloComputadoraExiste(String nombre) throws SQLException {
        String sql = "SELECT COUNT(*) FROM modelos_computadora WHERE nombre = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, nombre);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Retorna true si hay al menos un modelo con ese nombre
                }
            }
        }
        return false;
    }

    /**
     * Registra un nuevo modelo de computadora en la base de datos.
     * 
     * @param modeloComputadora El objeto ModeloComputadora que se desea registrar.
     * @throws SQLException En caso de error en la base de datos.
     */
    public void registrarModeloComputadora(ModeloComputadora modeloComputadora) throws SQLException {
        String sql = "INSERT INTO modelos_computadora (nombre, cant_procesador, cant_ram, cant_tarjeta_grafica, cant_ssd, precio, armada, vendida) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, modeloComputadora.getNombre());
            ps.setInt(2, modeloComputadora.getCantProcesador());
            ps.setInt(3, modeloComputadora.getCantRAM());
            ps.setInt(4, modeloComputadora.getCantTarjetaGrafica());
            ps.setInt(5, modeloComputadora.getCantSSD());
            ps.setDouble(6, modeloComputadora.getPrecio());
            ps.setBoolean(7, modeloComputadora.isArmada());
            ps.setBoolean(8, modeloComputadora.isVendida());
            ps.executeUpdate();
        }
    }
}
