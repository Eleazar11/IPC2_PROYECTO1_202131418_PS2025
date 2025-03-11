/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.servlets.ensamblaje;

import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.Componente;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.ObtenerComponentes;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author eleaz
 */
@WebServlet(name = "ObtenerComponentesServlet", urlPatterns = {"/ObtenerComponentesServlet"})
public class ObtenerComponentesServlet extends HttpServlet {

    private ObtenerComponentes obtenerComponentes;

    @Override
    public void init() throws ServletException {
        // Utilizamos la clase ConexionBaseDeDatos para obtener la conexión
        Connection connection = ConexionBaseDeDatos.getConnection();
        // Pasamos la conexión al constructor de ObtenerComponentes
        this.obtenerComponentes = new ObtenerComponentes(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Componente> componentes = obtenerComponentes.obtenerTodosLosComponentes();

            // Verificación para asegurar que piezas no sea null
            if (componentes == null) {
                componentes = new ArrayList<>(); // Asignamos una lista vacía si es null
            }

            // Depuración: Imprimir piezas
            System.out.println("Componentes obtenidos: " + componentes.size() + " componentes");

            request.setAttribute("componetes", componentes);
            request.setAttribute("success", true); // Agregamos un flag de éxito
            request.getRequestDispatcher("piezas.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("success", false);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener las piezas");

        }
    }
}
