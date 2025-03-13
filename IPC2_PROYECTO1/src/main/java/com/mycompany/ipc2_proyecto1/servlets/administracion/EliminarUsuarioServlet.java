/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.servlets.administracion;

import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.administracion.EliminarUsuario;
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
@WebServlet(name = "EliminarUsuarioServlet", urlPatterns = {"/EliminarUsuarioServlet"})
public class EliminarUsuarioServlet extends HttpServlet {

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

            // Recibir el username del usuario a eliminar
            String username = request.getParameter("username");

            // Eliminar el usuario de la base de datos
            EliminarUsuario eliminarUsuario = new EliminarUsuario(connection);
            eliminarUsuario.eliminarUsuario(username);

            // Redirigir a una página de confirmación en caso de éxito
            response.sendRedirect(request.getContextPath() + "/areaAdministracion/confirmacionAdmin.jsp"); // Página de éxito

        } catch (Exception e) {
            e.printStackTrace();
            // En caso de error, redirigir a una página de error
            response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp"); // Página de error
        }
    }
}