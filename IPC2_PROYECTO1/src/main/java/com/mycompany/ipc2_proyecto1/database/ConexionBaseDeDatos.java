/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author eleaz
 */
public class ConexionBaseDeDatos {

    private static final String URL_MYSQL = "jdbc:mysql://localhost:3306/computadorafeliz"; // Asegurarbos de que el nombre de la base de datos sea correcto
    private static final String USER = "root";
    private static final String PASSWORD = "Eleazar123Colop";
    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection != null) return connection;

        try {
            // Cargar el driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establecer la conexión
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            System.out.println("Conexión exitosa a la base de datos.");

        } catch (ClassNotFoundException e) {
            System.err.println("Error al cargar el driver JDBC: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error al conectar con la base de datos: " + e.getMessage());
        }

        return connection;
    }

    
}
