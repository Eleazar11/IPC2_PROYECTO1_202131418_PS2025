/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.servlets.ensamblaje;

import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.ensamblaje.EliminarComponente;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;

/**
 *
 * @author eleaz
 */
@WebServlet(name = "EliminarComponenteServlet", urlPatterns = {"/EliminarComponenteServlet"})
public class EliminarComponenteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener conexión a la base de datos
        Connection connection = ConexionBaseDeDatos.getConnection();

        try {
            if (connection == null) {
                System.out.println("No se pudo establecer la conexión a la base de datos.");
                response.sendRedirect(request.getContextPath() + "/areaEnsamblaje/error.jsp");
                return;
            }

            // Recibir el nombre del componente a eliminar
            String nombre = request.getParameter("nombre");

            // Eliminar el componente de la base de datos
            EliminarComponente eliminarComponente = new EliminarComponente(connection);
            eliminarComponente.eliminarComponente(nombre);

            response.sendRedirect(request.getContextPath() + "/areaEnsamblaje/confirmacion.jsp"); // Página de éxito

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/areaEnsamblaje/error.jsp"); // Página de error
        }
    }
}
