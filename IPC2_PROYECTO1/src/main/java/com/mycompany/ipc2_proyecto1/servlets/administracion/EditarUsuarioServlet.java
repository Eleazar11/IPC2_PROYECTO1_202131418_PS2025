/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.servlets.administracion;

import com.mycompany.ipc2_proyecto1.Usuario;
import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.administracion.ActualizarUsuario;
import com.mycompany.ipc2_proyecto1.database.administracion.ObtenerUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author eleaz
 */
@WebServlet(name = "EditarUsuarioServlet", urlPatterns = {"/EditarUsuarioServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class EditarUsuarioServlet extends HttpServlet {

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

            // Recibir los parámetros del formulario
            String username = request.getParameter("username"); // No se modifica
            String nuevoNombre = request.getParameter("nombre");
            String nuevoRol = request.getParameter("rol"); // ENSAMBLAJE, VENTAS o ADMINISTRACION

            // Verificar si el usuario existe antes de actualizar
            ObtenerUsuarios obtenerUsuarios = new ObtenerUsuarios(connection);
            List<Usuario> listaUsuarios = obtenerUsuarios.obtenerTodosLosUsuarios();

            boolean existe = listaUsuarios.stream().anyMatch(u -> u.getUsername().equalsIgnoreCase(username));

            if (!existe) {
                response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp");
                return;
            }

            // Actualizar el usuario en la base de datos
            ActualizarUsuario actualizarUsuario = new ActualizarUsuario(connection);
            actualizarUsuario.actualizarUsuario(username, nuevoNombre, nuevoRol);

            response.sendRedirect(request.getContextPath() + "/areaAdministracion/confirmacionAdmin.jsp"); // Página de éxito

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp"); // Página de error
        }
    }
}
