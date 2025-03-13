/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.servlets.administracion;

import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.administracion.EliminarModeloComputadora;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;

/**
 *
 * @author eleaz
 */
@WebServlet(name = "EliminarModeloComputadoraServlet", urlPatterns = {"/EliminarModeloComputadoraServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class EliminarModeloComputadoraServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener conexión a la base de datos
        Connection connection = ConexionBaseDeDatos.getConnection();

        try {
            if (connection == null) {
                System.out.println("No se pudo establecer la conexión a la base de datos.");
                response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp");
                return;
            }

            // Recibir el nombre del modelo de computadora a eliminar
            String nombre = request.getParameter("nombre");

            // Eliminar el modelo de la base de datos
            EliminarModeloComputadora eliminarModelo = new EliminarModeloComputadora(connection);
            eliminarModelo.eliminarModeloComputadora(nombre);

            response.sendRedirect(request.getContextPath() + "/areaAdministracion/confirmacionAdmin.jsp"); // Página de éxito

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp"); // Página de error
        }
    }
}
