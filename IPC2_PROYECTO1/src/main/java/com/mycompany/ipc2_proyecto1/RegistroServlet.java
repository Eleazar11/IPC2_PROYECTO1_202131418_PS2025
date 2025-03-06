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

/**
 *
 * @author eleaz
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class RegistroServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "C:\\Users\\eleaz\\Desktop\\IPC2-PS-2025\\a.p\\IPC2-A_PROYECTO1_202131418\\imagenes"; // Ruta para subir imágenes

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Crear la conexión
        Connection connection = ConexionBaseDeDatos.getConnection();

        try {
            if (connection == null) {
                System.out.println("No se pudo establecer la conexión a la base de datos.");
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo conectar a la base de datos.");
                return;
            }

            // Recibir los datos del formulario
            String nombre = request.getParameter("nombre");
            String username = request.getParameter("username");
            String contrasena = request.getParameter("contrasena");
            String tipoUsuario = request.getParameter("tipoUsuario").toLowerCase();
           
            // Verificar si el usuario ya existe
            InsertarUsuario insertarUsuario = new InsertarUsuario(connection);
            if (insertarUsuario.usuarioExiste(nombre)) {
                response.sendRedirect(request.getContextPath() + "/usuarioRepetido.jsp");
                return; // Salir del método
            }

            // Crear el objeto usuario
            Usuario usuario = new Usuario(
                    nombre,
                    username,
                    contrasena,
                    TipoUsuario.valueOf(tipoUsuario)
            );

            // Insertar el usuario en la base de datos
            insertarUsuario.registrarUsuario(usuario);

            // Redirigir a una página de confirmación
            response.sendRedirect(request.getContextPath() + "/confirmacion.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar la solicitud.");
        } finally {
            // Cerrar la conexión
        }
    }
}