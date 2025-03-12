/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.servlets.administracion;

import com.mycompany.ipc2_proyecto1.TipoUsuario;
import com.mycompany.ipc2_proyecto1.Usuario;
import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.InsertarUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

/**
 *
 * @author eleaz
 */
@WebServlet(name = "RegistroUsuariosAdminServlet", urlPatterns = {"/RegistroUsuariosAdminServlet"})
public class RegistroUsuariosAdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Crear la conexión
        Connection connection = ConexionBaseDeDatos.getConnection();

        try {
            if (connection == null) {
                System.out.println("No se pudo establecer la conexión a la base de datos.");
                response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp");
                return;
            }

            // Recibir los datos del formulario
            String nombre = request.getParameter("nombre");
            String username = request.getParameter("username");
            String contrasena = request.getParameter("contrasena");
            String tipoUsuario = request.getParameter("tipoUsuario").toLowerCase();

            // Verificar si el usuario ya existe
            InsertarUsuario insertarUsuario = new InsertarUsuario(connection);
            if (insertarUsuario.usuarioExiste(username)) { // Aquí deberías pasar username en vez de nombre
                response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp");
                return;
            }

            // Crear el objeto usuario
            Usuario usuario = new Usuario(
                    nombre,
                    username,
                    contrasena,
                    TipoUsuario.valueOf(tipoUsuario)
            );
            try {
                insertarUsuario.registrarUsuario(usuario);
                response.sendRedirect(request.getContextPath() + "/areaAdministracion/confirmacionAdmin.jsp"); // Si el registro es exitoso
            } catch (SQLIntegrityConstraintViolationException e) {
                response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp"); // Usuario duplicado
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/areaAdministracion/error.jsp"); // Página de error genérico
        } finally {
        }
    }
}
