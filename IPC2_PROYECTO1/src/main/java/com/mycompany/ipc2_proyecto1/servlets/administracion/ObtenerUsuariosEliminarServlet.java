/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.ipc2_proyecto1.servlets.administracion;

import com.mycompany.ipc2_proyecto1.Usuario;
import com.mycompany.ipc2_proyecto1.database.ConexionBaseDeDatos;
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
@WebServlet(name = "ObtenerUsuariosEliminarServlet", urlPatterns = {"/ObtenerUsuariosEliminarServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class ObtenerUsuariosEliminarServlet extends HttpServlet {

    private ObtenerUsuarios obtenerUsuarios;

    @Override
    public void init() throws ServletException {
        // Obtener la conexión a la base de datos y pasarla a la clase ObtenerUsuarios
        Connection connection = ConexionBaseDeDatos.getConnection();
        this.obtenerUsuarios = new ObtenerUsuarios(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtener la lista de usuarios
            List<Usuario> usuarios = obtenerUsuarios.obtenerTodosLosUsuarios();

            // Pasar la lista de usuarios al JSP de edición
            request.setAttribute("usuarios", usuarios);
            request.getRequestDispatcher("../../areaAdministracion/eliminarUsuarios.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener los usuarios para modificar.");
        }
    }
}

