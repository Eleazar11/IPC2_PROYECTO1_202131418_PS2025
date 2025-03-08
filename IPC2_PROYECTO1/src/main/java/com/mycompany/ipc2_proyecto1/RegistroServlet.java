/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ipc2_proyecto1;

import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
import com.mycompany.ipc2_proyecto1.database.InsertarUsuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLIntegrityConstraintViolationException;

/**
 *
 * @author eleaz
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Crear la conexión a la base de datos
        Connection connection = ConexionBaseDeDatos.getConnection();

        try {
            if (connection == null) {
                System.out.println("No se pudo establecer la conexión a la base de datos.");
                response.sendRedirect(request.getContextPath() + "/error.jsp");
                return;
            }

            // Recibir los datos del formulario
            String nombre = request.getParameter("nombre");
            String username = request.getParameter("username");
            String contrasena = request.getParameter("contrasena");
            String tipoUsuario = request.getParameter("tipoUsuario").toUpperCase();

            // Verificar si el usuario ya existe
            InsertarUsuario insertarUsuario = new InsertarUsuario(connection);
            if (insertarUsuario.usuarioExiste(username)) { // Se corrigió: ahora pasa el `username`
                response.sendRedirect(request.getContextPath() + "/usuarioRepetido.jsp");
                return;
            }

            // Crear el objeto usuario
            Usuario usuario = new Usuario(
                    nombre,
                    username,
                    contrasena,
                    TipoUsuario.valueOf(tipoUsuario)
            );

            // Intentar registrar el usuario
            try {
                insertarUsuario.registrarUsuario(usuario);
                response.sendRedirect(request.getContextPath() + "/confirmacion.jsp"); // Si el registro es exitoso
            } catch (SQLIntegrityConstraintViolationException e) {
                response.sendRedirect(request.getContextPath() + "/usuarioRepetido.jsp"); // Usuario duplicado
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp"); // Página de error genérico
        }
    }
}